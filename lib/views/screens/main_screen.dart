import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _systemBackButtonPressed,
      child: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          showSelectedLabels: false,
          showUnselectedLabels: false,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.list), label: 'Tasks'),
            BottomNavigationBarItem(icon: Icon(Icons.car_rental), label: 'Cars')
          ],
          currentIndex: _currentIndex,
          onTap: (index) => setState(() => _currentIndex = index),
        ),
        body: SafeArea(
            child: IndexedStack(
          index: _currentIndex,
          children: _navigators,
        )),
      ),
    );
  }
}
