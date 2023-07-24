import 'package:admin/components/logo.dart';
import 'package:flutter/material.dart';

class ScreenContainer extends StatelessWidget {
  final Widget child;
  final bool includeLogo;
  final String title;

  const ScreenContainer(
      {super.key,
      required this.child,
      required this.includeLogo,
      required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: title != '' ? AppBar(title: Text(title)) : null,
        body: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
                constraints: const BoxConstraints(minWidth: 300, maxWidth: 400),
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: includeLogo ? [const Logo(), child] : [child],
                ))
          ],
        ));
  }
}
