import 'package:admin/services/categories.dart';
import 'package:admin/services/movies.dart';
import 'package:flutter/material.dart';

class DialogBox extends StatelessWidget {
  final String categoryId;
  final String movieId;

  const DialogBox({super.key, required this.categoryId, required this.movieId});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Admin'),
      content: SingleChildScrollView(
        child: ListBody(
          children: const <Widget>[
            Text('O que você deseja fazer?'),
          ],
        ),
      ),
      actions: <Widget>[
        TextButton(
          child: const Text('Cancelar'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        TextButton(
          child: const Text('Apagar'),
          onPressed: () {
            if (movieId != '') {
              deleteMovie(movieId);
            }
            if (categoryId != '') {
              deleteCategory(categoryId);
            }
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}
