import 'package:flutter/material.dart';
import 'package:gacela_am/models/vehicule.dart';
import 'package:gacela_am/views/screens/cars/car_details_screen.dart';
import 'package:gacela_am/views/screens/cars/cars_screen.dart';
import 'package:provider/provider.dart';

import '../../../providers/auth_provider.dart';
import '../../../providers/cars_data_collector.dart';

class CarsNavigator extends StatelessWidget {
  static final GlobalKey<NavigatorState> carsNavigatorKey =
      GlobalKey<NavigatorState>();
  const CarsNavigator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: CarsNavigator.carsNavigatorKey,
      initialRoute: CarsScreen.route,
      onGenerateRoute: (settings) => MaterialPageRoute(
        builder: (context) {
          switch (settings.name) {
            case CarsScreen.route:
              return const CarsScreen();
            case CarDetailsScreen.route:
              final args = settings.arguments as Vehicule;
              return ChangeNotifierProvider<CarsDataCollector>(
                  create: (context) => CarsDataCollector(
                      Provider.of<AuthProvider>(context, listen: false)
                          .user!
                          .id!,
                      args.matricule),
                  child: CarDetailsScreen(car: args));
            default:
              return const CarsScreen();
          }
        },
      ),
    );
  }
}
