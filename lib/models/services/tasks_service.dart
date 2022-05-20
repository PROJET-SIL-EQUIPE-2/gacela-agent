import 'dart:convert';
import 'dart:io';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:gacela_am/models/panne.dart';
import 'package:gacela_am/models/task.dart';
import 'package:gacela_am/models/vehicule.dart';
import 'package:http/http.dart' as http;

import '../errors/failure.dart';

class TasksService {
  /// get all tasks
  Future<List<Task>> getAllTasks(String? token, int? agentId) async {
    final String url = '${dotenv.get("BASE_URL")}/tasks/$agentId';
    try {
      final response = await http.get(
        Uri.parse(url),
        headers: {
          "Content-Type": "application/json",
        },
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        List<dynamic> tasksAsMap = data["data"]["tasks"];
        List<Task> tasks = [];
        for (var element in tasksAsMap) {
          Task task = Task.fromJson(element);
          tasks.add(task);
        }
        return tasks;
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

  // get task details
  Future<Panne> getTaskDetails(int? taskId) async {
    final String url = '${dotenv.get("BASE_URL")}/tasks/details/$taskId';
    try {
      final response = await http.get(
        Uri.parse(url),
        headers: {
          "Content-Type": "application/json",
        },
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        List<dynamic> task = data["data"]["panne"];
        Panne panne = Panne.fromJson(task[0]);
        Vehicule vehicule = Vehicule.fromJson(task[0]["Vehicules"]);
        panne.setVehicule = vehicule;
        return panne;
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

  // increment task progress
  Future<bool> updateTaskProgress(int? taskId) async {
    final String url = '${dotenv.get("BASE_URL")}/tasks/progress/$taskId';
    try {
      final response = await http.put(
        Uri.parse(url),
        headers: {
          "Content-Type": "application/json",
        },
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        return data["success"];
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

  // set task to completed
  Future<bool> setTaskToCompleted(int? taskId) async {
    final String url = '${dotenv.get("BASE_URL")}/tasks/$taskId';
    try {
      final response = await http.put(
        Uri.parse(url),
        headers: {
          "Content-Type": "application/json",
        },
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        return data["success"];
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
