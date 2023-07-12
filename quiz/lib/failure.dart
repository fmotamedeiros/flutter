import 'package:flutter/material.dart';

class FailureResult extends StatelessWidget {
  const FailureResult({super.key, required this.correctQuestions});

  final int correctQuestions;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
            padding: const EdgeInsets.only(top: 32),
            child:
                Text('Pena! Você acertou apenas $correctQuestions perguntas!')),
      ],
    );
  }
}
