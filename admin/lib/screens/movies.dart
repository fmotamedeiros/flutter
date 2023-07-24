import 'package:admin/components/container.dart';
import 'package:flutter/material.dart';

class MoviesScreen extends StatelessWidget {
  MoviesScreen({super.key});

  final List<String> entries = <String>['A', 'B', 'C'];
  final List<int> colorCodes = <int>[600, 500, 100];

  @override
  Widget build(BuildContext context) {
    return ScreenContainer(
      includeLogo: false,
      title: 'Filmes',
      child: Expanded(
          child: ListView.separated(
        padding: const EdgeInsets.all(8),
        itemCount: entries.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            height: 50,
            color: Colors.amber[colorCodes[index]],
            child: Center(child: Text('Entry ${entries[index]}')),
          );
        },
        separatorBuilder: (BuildContext context, int index) => const Divider(),
      )),
    );
  }
}
