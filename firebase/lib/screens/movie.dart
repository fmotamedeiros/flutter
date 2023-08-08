import 'package:admin/components/container.dart';
import 'package:admin/components/dropdown.dart';
import 'package:admin/utils/routes.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class MovieScreen extends StatefulWidget {
  const MovieScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return Movie();
  }
}

class Movie extends State<MovieScreen> {
  String movie = '';
  String categoryId = '';

  bool isLoggedIn = false;

  final _formKey = GlobalKey<FormState>();

  CollectionReference movies = FirebaseFirestore.instance.collection('movies');

  void addMovie() {
    _formKey.currentState?.save();
    movies.add({'title': movie, 'categoryId': categoryId}).then((value) {
      if (kDebugMode) {
        print("Filme adicionado...");
      }
      Navigator.of(context).pushReplacementNamed(Routes.movies);
    }).catchError((error) {
      if (kDebugMode) {
        print("Falha ao adicionar: $error");
        ;
      }
    });
  }

  void setCategoryId(id) {
    setState(() {
      categoryId = id;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: MediaQuery.of(context).size.width * 0.25,
        child: ScreenContainer(
            includeLogo: false,
            title: 'Adicionar Filme',
            child: Form(
                key: _formKey,
                child: Column(children: [
                  TextFormField(
                      decoration: const InputDecoration(
                          labelText: 'Descrição do filme'),
                      keyboardType: TextInputType.emailAddress,
                      onSaved: (value) => movie = value!),
                  DropdownButtonExample(setCategoryId: setCategoryId),
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: ElevatedButton(
                      onPressed: addMovie,
                      child: const Text('Adicionar'),
                    ),
                  ),
                ]))));
  }
}
