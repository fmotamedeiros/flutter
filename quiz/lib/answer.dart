import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {
  const AnswerButton({super.key, required this.action, required this.text});

  final void Function() action;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 24, right: 24, top: 12),
      child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: 30,
          child: ElevatedButton(onPressed: action, child: Text(text))),
    );
  }
}
