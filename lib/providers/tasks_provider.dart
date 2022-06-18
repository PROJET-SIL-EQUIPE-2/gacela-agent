import 'package:flutter/cupertino.dart';
import 'package:gacela_am/models/services/tasks_service.dart';
import 'package:gacela_am/models/task.dart';

import '../models/panne.dart';

class TasksProvider with ChangeNotifier {
  List<Task> tasks = [];
  double globalProgress = 0;
  int tasksNotCompleted = 0;
  int carsNumber = 0;

  Future<bool> getAllTasks(String? token, int? agentId) async {
    final TasksService tasksService = TasksService();
    tasks = await tasksService.getAllTasks(token, agentId);
    calculateProgress();
    notifyListeners();
    return true;
  }

  Future<int> getTaskDetails(Task task) async {
    final int index =
        tasks.indexWhere((element) => element.taskId == task.taskId);
    if (task.panne != null) return index;
    final TasksService tasksService = TasksService();
    final Panne panne = await tasksService.getTaskDetails(task.taskId);
    tasks[index].setPanne = panne;
    return index;
  }

  Future<bool> updateTaskProgress(Task task) async {
    final int index =
        tasks.indexWhere((element) => element.taskId == task.taskId);
    if (tasks[index].progress != null) {
      tasks[index].progress = (tasks[index].progress! + 10);
      notifyListeners();
    }

    final TasksService tasksService = TasksService();
    final bool? success = await tasksService.updateTaskProgress(task.taskId);
    if (success == true) {
      return true;
    } else {
      tasks[index].progress = (tasks[index].progress! - 10);

      calculateProgress();
      notifyListeners();
      return false;
    }
  }

  Future<bool> setTaskToCompleted(Task task) async {
    final int index =
        tasks.indexWhere((element) => element.taskId == task.taskId);
    int? oldProgress = tasks[index].progress;
    tasks[index].progress = 100;
    tasks[index].completed = true;
    notifyListeners();

    final TasksService tasksService = TasksService();
    final bool? success = await tasksService.setTaskToCompleted(task.taskId);

    if (success == true) {
      return true;
    } else {
      tasks[index].progress = oldProgress;
      tasks[index].completed = false;
      notifyListeners();
      return false;
    }
  }

  calculateProgress() {
    int total = 0;
    int incompletedTasksNumber = 0;
    tasks.forEach((element) {
      total += element.progress ?? 0;
      if (!element.completed!) incompletedTasksNumber++;
    });
    globalProgress = total / (100 * tasks.length);
    tasksNotCompleted = incompletedTasksNumber;
  }
}
