import 'package:admin/services/categories.dart';
import 'package:flutter/material.dart';

class DropdownButtonExample extends StatefulWidget {
  const DropdownButtonExample({super.key, required this.setCategoryId});

  final Function setCategoryId;

  @override
  State<DropdownButtonExample> createState() =>
      // ignore: no_logic_in_create_state
      _DropdownButtonExampleState(setCategoryId);
}

class _DropdownButtonExampleState extends State<DropdownButtonExample> {
  late List<Map<String, Object?>> categories = [];
  late Map<String, Object?> dropdownValue;

  final Function setCategoryId;

  _DropdownButtonExampleState(this.setCategoryId);

  void getData() async {
    var categoriesData = await getCategoriesData();
    setState(() {
      if (categories.isEmpty) {
        categories = categoriesData;
        dropdownValue = categoriesData.elementAt(0);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    getData();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 12),
          child: categories.isNotEmpty
              ? DropdownButton<Map<String, Object?>>(
                  isExpanded: true,
                  focusNode: FocusNode(canRequestFocus: false),
                  value: dropdownValue,
                  elevation: 16,
                  style: const TextStyle(color: Colors.grey),
                  underline: Container(
                    height: 2,
                    color: Colors.grey,
                  ),
                  onChanged: (Map<String, Object?>? value) {
                    setCategoryId(value!['id']);
                    setState(() {
                      dropdownValue = value;
                    });
                  },
                  items: categories.map<DropdownMenuItem<Map<String, Object?>>>(
                      (Map<String, Object?> value) {
                    return DropdownMenuItem<Map<String, Object?>>(
                      value: value,
                      child: Text(value['title'].toString()),
                    );
                  }).toList(),
                )
              : const Text('Carregando...'),
        )
      ],
    );
  }
}
