import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:movies/model/movie.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

Future<List<Movie>> fetchTrendingMovies() async {
  String? apiKey = dotenv.env['API_KEY'];
  final response = await http.get(Uri.parse(
      'https://api.themoviedb.org/3/trending/movie/day?api_key=$apiKey'));

  if (response.statusCode == 200) {
    var jsonResponse = json.decode(response.body);
    List<Movie> movies = (jsonResponse['results'] as List)
        .map((data) => Movie.fromJson(data))
        .toList();
    return movies;
  } else {
    throw Exception('Falha ao carregar filmes');
  }
}
