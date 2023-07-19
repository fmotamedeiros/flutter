import 'package:flutter/material.dart';
import 'package:movies/models/category.dart';

class ItemScreen extends StatelessWidget {
  const ItemScreen({Key? key, required this.category}) : super(key: key);

  final Category category;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(category.title),
      ),
      body: const Center(
        child: Text('Filmes por Categoria'),
      ),
    );
  }
}
