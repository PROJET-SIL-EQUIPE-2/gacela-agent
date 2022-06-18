import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gacela_am/config/theme/colors.dart';
import 'package:gacela_am/models/errors/failure.dart';
import 'package:gacela_am/providers/auth_provider.dart';
import 'package:gacela_am/providers/cars_provider.dart';
import 'package:gacela_am/providers/support_provider.dart';
import 'package:gacela_am/providers/tasks_provider.dart';
import 'package:provider/provider.dart';
import 'navigators.dart';

class MainScreen extends StatefulWidget {
  static const route = "/main";
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;
  final _navigators = [
    const HomeNavigator(),
    const TasksNavigator(),
    const CarsNavigator(),
  ];

  final List<GlobalKey<NavigatorState>> _navigatorKeys = [
    HomeNavigator.homeNavigatorKey,
    TasksNavigator.tasksNavigatorKey,
    CarsNavigator.carsNavigatorKey,
  ];

  Future<bool> _systemBackButtonPressed() async {
    if (_navigatorKeys[_currentIndex].currentState!.canPop()) {
      _navigatorKeys[_currentIndex]
          .currentState!
          .pop(_navigatorKeys[_currentIndex].currentContext);
    } else {
      if (_currentIndex != 0) {
        setState(() {
          _currentIndex = 0;
        });
      } else {
        await SystemChannels.platform.invokeMethod<void>('SystemNavigator.pop');
      }
    }
    return false;
  }

  Future<void> saveTokenToDatabase(String? token) async {
    try {
      await Provider.of<AuthProvider>(context, listen: false)
          .saveNotificationToken(token);
    } on Failure catch (e) {
      Future.delayed(const Duration(seconds: 0))
          .then((value) => ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              backgroundColor: GacelaColors.gacelaRed,
              content: Text(
                e.message,
                style: const TextStyle(color: Colors.white),
              ))));
    }
  }

  Future<void> setupToken() async {
    // Get the token each time the application loads
    String? token = await FirebaseMessaging.instance.getToken();
    print(token);

    // Save the initial token to the database
    await saveTokenToDatabase(token!);

    // Any time the token refreshes, store this in the database too.
    FirebaseMessaging.instance.onTokenRefresh.listen(saveTokenToDatabase);
  }

  @override
  void initState() {
    super.initState();
    setupToken();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _systemBackButtonPressed,
      child: MultiProvider(
        providers: [
          ChangeNotifierProvider<TasksProvider>(
            create: (context) => TasksProvider(),
          ),
          ChangeNotifierProvider<SupportProvider>(
            create: (context) => SupportProvider(),
          ),
          ChangeNotifierProvider<CarsProvider>(
            create: (context) => CarsProvider(),
          ),
        ],
        child: Scaffold(
          bottomNavigationBar: Container(
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  offset: const Offset(0, 1),
                  blurRadius: 4,
                )
              ],
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(25),
                topRight: Radius.circular(25),
              ),
            ),
            child: BottomNavigationBar(
              showSelectedLabels: false,
              showUnselectedLabels: false,
              selectedItemColor: GacelaColors.gacelaPurple,
              backgroundColor: Colors.white,
              elevation: 0,
              iconSize: 30,
              items: const [
                BottomNavigationBarItem(
                    icon: Icon(Icons.home_outlined), label: 'Home'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.checklist_sharp), label: 'Tasks'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.local_taxi_outlined), label: 'Cars')
              ],
              currentIndex: _currentIndex,
              onTap: (index) => setState(() => _currentIndex = index),
            ),
          ),
          body: SafeArea(
              child: IndexedStack(
            index: _currentIndex,
            children: _navigators,
          )),
        ),
      ),
    );
  }
}
