import 'package:flutter/material.dart';
import 'tasks_screen.dart';

class TasksNavigator extends StatelessWidget {
  static final GlobalKey<NavigatorState> tasksNavigatorKey =
      GlobalKey<NavigatorState>();
  const TasksNavigator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: TasksNavigator.tasksNavigatorKey,
      initialRoute: TasksScreen.route,
      onGenerateRoute: (settings) => MaterialPageRoute(
        builder: (context) {
          switch (settings.name) {
            case TasksScreen.route:
              return const TasksScreen();
            default:
              return const TasksScreen();
          }
        },
      ),
    );
  }
}
