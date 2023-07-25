import 'package:admin/components/container.dart';
import 'package:admin/components/exit.dart';
import 'package:admin/components/item.dart';
import 'package:admin/utils/routes.dart';
import 'package:flutter/material.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenContainer(
        includeLogo: false,
        title: 'Admin',
        child: Expanded(
          child: GridView(
            padding: const EdgeInsets.only(left: 4, right: 4, top: 20),
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 400,
              childAspectRatio: 5 / 0.8,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20,
            ),
            children: const [
              MenuItem(
                  buttonText: 'Nova Categoria',
                  routePath: Routes.category,
                  color: Colors.blue),
              MenuItem(
                  buttonText: 'Listar Categorias',
                  routePath: Routes.categories,
                  color: Colors.blue),
              MenuItem(
                  buttonText: 'Novo Filme',
                  routePath: Routes.movie,
                  color: Colors.blue),
              MenuItem(
                  buttonText: 'Listar Filme',
                  routePath: Routes.movies,
                  color: Colors.blue),
              ExitItem(
                  buttonText: 'Sair',
                  routePath: Routes.login,
                  color: Colors.grey)
            ],
          ),
        ));
  }
}
