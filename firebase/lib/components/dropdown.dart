import 'package:flutter/material.dart';

const List<String> list = <String>['Comédia', 'Drama', 'Romance', 'Terror'];

class DropdownButtonExample extends StatefulWidget {
  const DropdownButtonExample({super.key});

  @override
  State<DropdownButtonExample> createState() => _DropdownButtonExampleState();
}

class _DropdownButtonExampleState extends State<DropdownButtonExample> {
  String dropdownValue = list.first;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 12),
          child: DropdownButton<String>(
            isExpanded: true,
            focusNode: FocusNode(canRequestFocus: false),
            value: dropdownValue,
            elevation: 16,
            style: const TextStyle(color: Colors.grey),
            underline: Container(
              height: 2,
              color: Colors.grey,
            ),
            onChanged: (String? value) {
              setState(() {
                dropdownValue = value!;
              });
            },
            items: list.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
        )
      ],
    );
  }
}
