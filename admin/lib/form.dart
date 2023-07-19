import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthForm extends StatefulWidget {
  const AuthForm({super.key});

  @override
  State<StatefulWidget> createState() {
    return AuthFormView();
  }
}

class AuthFormView extends State<AuthForm> {
  String email = '';
  String password = '';
  bool isLoggedIn = false;

  final _formKey = GlobalKey<FormState>();

  Future<void> login() async {
    _formKey.currentState?.save();
    final FirebaseAuth auth = FirebaseAuth.instance;

    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        if (kDebugMode) {
          print('User is currently signed out!');
          print(user);
          setState(() {
            isLoggedIn = false;
          });
        }
      } else {
        if (kDebugMode) {
          print('User is signed in!');
          print(user);
          setState(() {
            isLoggedIn = true;
          });
        }
      }
    });

    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);
      //final User user = result.user!;
    } on FirebaseAuthException catch (e) {
      if (kDebugMode) {
        print('Failed with error code: ${e.code}');
        print(e.message);
      }
    }
  }

  Future<void> logout() async {
    final FirebaseAuth auth = FirebaseAuth.instance;
    await auth.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: MediaQuery.of(context).size.width * 0.75,
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
              ElevatedButton(
                onPressed: login,
                child: const Text('Login'),
              ),
              isLoggedIn
                  ? ElevatedButton(
                      onPressed: logout,
                      child: const Text('Sair'),
                    )
                  : const Text('Usuário não logado!')
            ])));
  }
}
