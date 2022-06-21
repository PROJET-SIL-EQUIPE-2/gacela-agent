import 'package:flutter/cupertino.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class CarsDataCollector with ChangeNotifier {
  late IO.Socket socket;

  String? matricule;

  double? temperature = 0;
  double? speed = 0;
  double? charge = 0;

  double? lat = 0;
  double? long = 0;

  GoogleMapController? controller;

  // car live data
  @override
  CarsDataCollector(int agentId, this.matricule) {
    final url = dotenv.get("COLLECTOR_URL");
    socket = IO.io(url, <String, dynamic>{
      "transports": ["websocket"],
      "autoConnect": false
    });

    socket.connect();
    socket.onConnect((_) {
      print('\n\nconnected\n\n');
    });

    socket.emit("join", "agent_$agentId");

    socket.on("fetch_car_data", (data) {
      print("$data");
      if (data != null) {
        if (matricule == data["matricule"]) {
          temperature = double.tryParse(data["temperature"].toString()) ?? 0;
          speed = double.tryParse(data["speed"].toString()) ?? 0;
          charge = double.tryParse(data["charge"].toString()) ?? 0;
          lat = double.tryParse(data["lat"].toString()) ?? 0;
          long = double.tryParse(data["long"].toString()) ?? 0;
          notifyListeners();
          if (controller != null) {
            controller!.animateCamera(
              CameraUpdate.newCameraPosition(
                CameraPosition(
                  target: LatLng(lat!, long!),
                  zoom: 14,
                ),
              ),
            );
          }
        }
      }
    });
  }

  void disconnect() {
    socket.dispose();
    controller?.dispose();
  }
}
