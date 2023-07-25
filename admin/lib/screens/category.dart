import 'package:admin/components/container.dart';
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

  Future<void> login() async {
    _formKey.currentState?.save();
    if (kDebugMode) {
      print(category);
    }
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
                keyboardType: TextInputType.emailAddress,
                onSaved: (value) => category = value!),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: ElevatedButton(
                onPressed: login,
                child: const Text('Adicionar'),
              ),
            ),
          ])),
    );
  }
}
