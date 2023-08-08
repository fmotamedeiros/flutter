import 'package:admin/components/alert.dart';
import 'package:admin/components/box.dart';
import 'package:admin/components/container.dart';
import 'package:admin/services/categories.dart';
import 'package:flutter/material.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return CategoriesScreenView();
  }
}

class CategoriesScreenView extends State<CategoriesScreen> {
  List categories = [];

  Future<void> _showMyDialog(context, id) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return DialogBox(categoryId: id, movieId: '');
      },
    );
  }

  void getData() async {
    var categoriesData = await getCategoriesData();
    setState(() {
      categories = categoriesData;
    });
  }

  @override
  Widget build(BuildContext context) {
    getData();
    return ScreenContainer(
      includeLogo: false,
      title: 'Categorias',
      child: Expanded(
          child: Column(
        children: categories.isNotEmpty
            ? categories
                .map((category) => InkWell(
                    onTap: () {
                      _showMyDialog(context, category['id']);
                    },
                    child: TextBox(text: '${category['title']}')))
                .toList()
            : [const Text('Carregando...')],
      )),
    );
  }
}
