import 'package:flutter/material.dart';
import 'package:gacela_am/views/screens/home/edit_profile_screen.dart';
import 'notifications_screen.dart';
import 'profile_screen.dart';
import 'home_screen.dart';

class HomeNavigator extends StatelessWidget {
  static final GlobalKey<NavigatorState> homeNavigatorKey =
      GlobalKey<NavigatorState>();
  const HomeNavigator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: HomeNavigator.homeNavigatorKey,
      initialRoute: HomeScreen.route,
      onGenerateRoute: (settings) => MaterialPageRoute(builder: (context) {
        switch (settings.name) {
          case HomeScreen.route:
            return const HomeScreen();
          case ProfileScreen.route:
            return const ProfileScreen();
          case EditProfileScreen.route:
            return const EditProfileScreen();
          case NotificationsScreen.route:
            return const NotificationsScreen();
          // here we add the new pages routes
          default:
            return const HomeScreen();
        }
      }),
    );
  }
}
