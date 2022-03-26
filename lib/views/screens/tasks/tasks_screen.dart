import 'package:flutter/material.dart';

class TasksScreen extends StatelessWidget {
  static const route = "/";
  const TasksScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tasks Screen"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [Text("Tasks Screen")],
        ),
      ),
    );
  }
}
