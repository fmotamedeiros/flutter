import 'package:flutter/material.dart';

void main() {
  runApp(const Minimal());
}

class Minimal extends StatelessWidget {
  const Minimal({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Text('Minimal App'),
    );
  }
}
