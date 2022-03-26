import 'package:flutter/material.dart';

class CarsScreen extends StatelessWidget {
  static const route = "/";
  const CarsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cars Screen"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [Text("Cars Screen")],
        ),
      ),
    );
  }
}
