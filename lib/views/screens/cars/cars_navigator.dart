import 'package:flutter/material.dart';
import 'package:gacela_am/views/screens/cars/cars_screen.dart';

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
            default:
              return const CarsScreen();
          }
        },
      ),
    );
  }
}
