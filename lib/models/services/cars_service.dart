import 'dart:convert';
import 'dart:io';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

import '../errors/failure.dart';
import '../vehicule.dart';

class CarsService {
  Future<List<Vehicule>> getAssignedCars(String? email) async {
    final String url = '${dotenv.get("BASE_URL")}/vehicles/assigned';
    try {
      final response = await http.post(Uri.parse(url),
          headers: {
            "Content-Type": "application/json",
          },
          body: jsonEncode({
            "email": email,
          }));

      if (response.statusCode == 200) {
        final res = json.decode(response.body);
        final List carsAsMap = res["data"] as List<dynamic>;

        List<Vehicule> carsList = [];
        for (var car in carsAsMap) {
          carsList.add(Vehicule.fromJson(car));
        }
        return carsList;
      } else {
        final data = jsonDecode(response.body);
        throw Failure(data["errors"][0]["msg"], code: response.statusCode);
      }
    } on SocketException {
      throw Failure('No Internet connection 😑');
    } on HttpException {
      throw Failure("Couldn't find the post 😱");
    } on FormatException {
      throw Failure("Bad response format 👎");
    } catch (e) {
      print(e);
      rethrow;
    }
  }
}
