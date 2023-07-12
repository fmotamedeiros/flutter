import 'package:flutter/material.dart';

class ResetButton extends StatelessWidget {
  const ResetButton({super.key, required this.action});

  final void Function() action;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 24, right: 24, top: 12),
      child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: 30,
          child: ElevatedButton(
              onPressed: action, child: const Text("Reiniciar o Quiz!"))),
    );
  }
}
