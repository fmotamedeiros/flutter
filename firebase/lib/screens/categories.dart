import 'package:admin/components/alert.dart';
import 'package:admin/components/container.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return CategoriesScreenView();
  }
}

class CategoriesScreenView extends State<CategoriesScreen> {
  List categories = [];

  final CollectionReference _collectionRef =
      FirebaseFirestore.instance.collection('categories');

  Future<void> _showMyDialog(context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return const DialogBox();
      },
    );
  }

  Future<void> getData() async {
    QuerySnapshot querySnapshot = await _collectionRef.get();
    final allData = querySnapshot.docs.map((doc) => doc.data()).toList();
    setState(() {
      categories = allData;
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
                      _showMyDialog(context);
                    },
                    child: Container(
                      height: 50,
                      margin: const EdgeInsets.only(top: 8),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          gradient: LinearGradient(colors: [
                            Color(int.parse('0xff${category['color']}'))
                                .withOpacity(0.75),
                            Color(int.parse('0xff${category['color']}'))
                          ])),
                      child: Center(
                          child: Text('${category['title']}',
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 18))),
                    )))
                .toList()
            : [const Text('Carregando...')],
      )),
    );
  }
}
