import 'package:admin/components/alert.dart';
import 'package:admin/components/box.dart';
import 'package:admin/components/container.dart';
import 'package:admin/services/movies.dart';
import 'package:flutter/material.dart';

class MoviesScreen extends StatefulWidget {
  const MoviesScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return MoviesScreenView();
  }
}

class MoviesScreenView extends State<MoviesScreen> {
  List movies = [];

  Future<void> _showMyDialog(context, id) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return DialogBox(movieId: id, categoryId: '');
      },
    );
  }

  void getData() async {
    var moviesData = await getMoviesData();
    setState(() {
      movies = moviesData;
    });
  }

  @override
  Widget build(BuildContext context) {
    getData();
    return ScreenContainer(
      includeLogo: false,
      title: 'Filmes',
      child: Column(
        children: movies.isNotEmpty
            ? movies
                .map((movie) => InkWell(
                    onTap: () {
                      _showMyDialog(context, movie['id']);
                    },
                    child: TextBox(text: '${movie['title']}')))
                .toList()
            : [const Text('Carregando...')],
      ),
    );
  }
}
