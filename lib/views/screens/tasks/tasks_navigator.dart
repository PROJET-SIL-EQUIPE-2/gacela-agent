import 'package:flutter/material.dart';
import 'package:gacela_am/models/task.dart';
import 'package:gacela_am/views/screens.dart';
import 'package:gacela_am/views/screens/home/home_screen.dart';
import 'package:gacela_am/views/screens/tasks/support_details.dart';
import 'package:gacela_am/views/screens/tasks/task_details.dart';
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
            case SupportDetails.route:
              return const SupportDetails();
            case Taskdetails.route:
              final args = settings.arguments as Task;
              return Taskdetails(task: args);
            default:
              return const TasksScreen();
          }
        },
      ),
    );
  }
}
