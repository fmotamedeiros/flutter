import 'package:flutter/material.dart';

class TextBox extends StatelessWidget {
  final String text;

  const TextBox({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      margin: const EdgeInsets.only(top: 8),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          gradient: LinearGradient(
              colors: [Colors.grey.withOpacity(0.75), Colors.grey])),
      child: Center(
          child: Text(text,
              style: const TextStyle(color: Colors.white, fontSize: 18))),
    );
  }
}
