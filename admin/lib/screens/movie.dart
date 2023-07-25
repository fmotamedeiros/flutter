import 'package:admin/components/container.dart';
import 'package:admin/components/logo.dart';
import 'package:admin/components/dropdown.dart';
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
                      onSaved: (value) => category = value!),
                  const DropdownButtonExample(),
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: ElevatedButton(
                      onPressed: login,
                      child: const Text('Adicionar'),
                    ),
                  ),
                ]))));
  }
}
