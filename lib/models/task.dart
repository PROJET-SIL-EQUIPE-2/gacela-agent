// To parse this JSON data, do
//
//     final task = taskFromJson(jsonString);

import 'dart:convert';

import 'package:gacela_am/models/panne.dart';

Task taskFromJson(String str) => Task.fromJson(json.decode(str));

class Task {
  Task(
      {this.taskId,
      this.agentId,
      this.date,
      this.panneId,
      this.description,
      this.completed,
      this.important,
      this.progress});

  int? taskId;
  int? agentId;
  DateTime? date;
  int? panneId;
  String? description;
  bool? completed;
  bool? important;
  int? progress;

  Panne? panne;
  set setPanne(Panne? panne) {
    this.panne = panne;
  }

  factory Task.fromJson(Map<String, dynamic> json) => Task(
      taskId: json["task_id"],
      agentId: json["agent_id"],
      date: DateTime.parse(json["date"]),
      panneId: json["panne_id"],
      description: json["description"],
      completed: json["completed"],
      important: json["important"],
      progress: json["progress"]);
}
