import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movies/model/movie.dart';
import 'package:movies/service/movie_service.dart';

class TrendingMoviesList extends StatelessWidget {
  const TrendingMoviesList({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Movie>>(
      future: fetchTrendingMovies(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text('Erro: ${snapshot.error}');
        } else {
          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              return ListTile(
                leading: CachedNetworkImage(
                  imageUrl:
                      'https://image.tmdb.org/t/p/w500${snapshot.data![index].posterPath}',
                  placeholder: (context, url) =>
                      const CircularProgressIndicator(),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
                title: Text(snapshot.data![index].title),
              );
            },
          );
        }
      },
    );
  }
}
