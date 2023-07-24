import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  const Logo({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 120, bottom: 60),
      child: Image.asset(
        'assets/logo.png',
        width: 240.0,
        height: 80.0,
        fit: BoxFit.cover,
      ),
    );
  }
}
