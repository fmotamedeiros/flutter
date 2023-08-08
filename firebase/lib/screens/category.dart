import 'package:admin/components/container.dart';
import 'package:admin/utils/routes.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return Category();
  }
}

class Category extends State<CategoryScreen> {
  String category = '';
  bool isLoggedIn = false;

  final _formKey = GlobalKey<FormState>();
  CollectionReference categories =
      FirebaseFirestore.instance.collection('categories');

  void addCategory() {
    _formKey.currentState?.save();
    categories.add({'title': category}).then((value) {
      if (kDebugMode) {
        print("Categoria adicionada...");
      }
      Navigator.of(context).pushReplacementNamed(Routes.categories);
    }).catchError((error) {
      if (kDebugMode) {
        print("Falha ao adicionar: $error");
        ;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return ScreenContainer(
      includeLogo: false,
      title: 'Adicionar Categoria',
      child: Form(
          key: _formKey,
          child: Column(children: [
            TextFormField(
                decoration:
                    const InputDecoration(labelText: 'Descrição da categoria'),
                keyboardType: TextInputType.text,
                onSaved: (value) => category = value!),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: ElevatedButton(
                onPressed: addCategory,
                child: const Text('Adicionar'),
              ),
            ),
          ])),
    );
  }
}
