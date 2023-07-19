import 'package:flutter/material.dart';
import 'package:movies/screens/categories.dart';

void main() {
  runApp(const Minimal());
}

class Minimal extends StatelessWidget {
  const Minimal({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Filmes'),
        ),
        body: const CategoriesScreen(),
      ),
    );
  }
}
