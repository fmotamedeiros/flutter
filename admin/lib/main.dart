import 'package:admin/form.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const Minimal());
}

// If Flutter needs to call native code before calling runApp makes sure that
//you have an instance of the WidgetsBinding, which is required to use platform
//channels to call the native code.

class Minimal extends StatelessWidget {
  const Minimal({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Admin'),
        ),
        body: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                  gradient: LinearGradient(colors: [
                Color.fromRGBO(37, 150, 190, 0.5),
                Color.fromRGBO(118, 181, 197, 0.7),
              ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
            ),
            const SizedBox(
              width: double.infinity,
              child: Column(
                children: [
                  Text('Entre com os dados para continuar'),
                  AuthForm()
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

//A classe Stack é útil se você quiser sobrepor vários widgets filhos de uma
//forma simples, por exemplo, ter algum texto e uma imagem, sobreposta
//com um gradiente e um botão anexado ao fundo.

// Use container to add padding, margins, borders, background color,
//or other decorations to a widget.
