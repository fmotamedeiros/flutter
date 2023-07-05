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

  void decrement() {}

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Counter'),
        ),
        body: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: increment,
                style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(horizontal: 20)),
                child: const Text("Incrementar")),
            const SizedBox(
              width: 12,
            ),
            ElevatedButton(
                onPressed: decrement,
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueGrey,
                    padding: const EdgeInsets.symmetric(horizontal: 20)),
                child: const Text("Decrementar")),
          ],
        ),
      ),
    );
  }
}
