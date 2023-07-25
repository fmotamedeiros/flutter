import 'package:admin/components/container.dart';
import 'package:admin/utils/routes.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return Login();
  }
}

class Login extends State<LoginScreen> {
  String email = '';
  String password = '';
  bool isLoggedIn = false;

  final _formKey = GlobalKey<FormState>();

  Future<void> login() async {
    _formKey.currentState?.save();
    if (kDebugMode) {
      print(email);
      print(password);
    }
    Navigator.of(context).pushReplacementNamed(Routes.menu);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScreenContainer(
        includeLogo: true,
        title: '',
        child: Form(
            key: _formKey,
            child: Column(children: [
              TextFormField(
                  decoration: const InputDecoration(labelText: 'Email'),
                  keyboardType: TextInputType.emailAddress,
                  onSaved: (value) => email = value!),
              TextFormField(
                  decoration: const InputDecoration(labelText: 'Senha'),
                  obscureText: true,
                  onSaved: (value) => password = value!),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: ElevatedButton(
                  onPressed: login,
                  child: const Text('Login'),
                ),
              ),
            ])),
      ),
    );
  }
}
