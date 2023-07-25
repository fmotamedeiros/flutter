import 'package:admin/screens/categories.dart';
import 'package:admin/screens/category.dart';
import 'package:admin/screens/login.dart';
import 'package:admin/screens/menu.dart';
import 'package:admin/screens/movie.dart';
import 'package:admin/screens/movies.dart';
import 'package:admin/utils/routes.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const Admin());
}

class Admin extends StatelessWidget {
  const Admin({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        Routes.login: (ctx) => const LoginScreen(),
        Routes.menu: (ctx) => const MenuScreen(),
        Routes.category: (ctx) => const CategoryScreen(),
        Routes.categories: (ctx) => CategoriesScreen(),
        Routes.movie: (ctx) => const MovieScreen(),
        Routes.movies: (ctx) => MoviesScreen(),
      },
    );
  }
}
