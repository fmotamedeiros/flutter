import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  void increment() {}

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: CounterView());
  }
}

class CounterView extends StatelessWidget {
  const CounterView({super.key});

  void increment() {}

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Counter'),
        ),
        body: ElevatedButton(
            onPressed: increment, child: const Text("Incrementar")),
      ),
    );
  }
}
