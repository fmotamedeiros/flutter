import 'package:admin/components/container.dart';
import 'package:admin/utils/routes.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

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
  final FirebaseAuth auth = FirebaseAuth.instance;

  @override
  void initState() {
    super.initState();
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user != null) {
        if (kDebugMode) {
          print('User is signed in!');
          print(user);
          //Navigator.of(context).pop(this);
          Navigator.of(context).pushReplacementNamed(Routes.menu);
        }
      }
    });
  }

  Future<void> login() async {
    _formKey.currentState?.save();

    try {
      if (kDebugMode) {
        print(email);
        print(password);
      }
      await auth.signInWithEmailAndPassword(email: email, password: password);
      //final User user = result.user!;
    } on FirebaseAuthException catch (e) {
      if (kDebugMode) {
        print('Failed with error code: ${e.code}');
        print(e.message);
      }
    }
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
