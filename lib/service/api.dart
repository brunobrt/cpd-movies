import 'dart:convert';

import 'package:cpd_movies/utils/serializer.dart';

import '../models/tmdb_movie.dart';
import 'package:http/http.dart' as http;

Future<List<TmdbMovies>> movieList({required int page}) async {
  final baseUrls =
      'https://api.themoviedb.org/3/movie/upcoming?api_key=17eca5510d7811c5fea0b95824f0b387&language=en-US&page=$page';

  try {
    final response = await http.get(Uri.parse(baseUrls));
    final movies = json.decode(response.body)['results'];
    if (movies == null) {
      throw Exception('Unable to connect');
    } else {
      final list = movies
          .map((item) =>
              serializers.deserializeWith(TmdbMovies.serializer, item))
          .toList()
          .cast<TmdbMovies>();
      return list;
    }
  } catch (error) {
    print('Error: $error');
    return [];
  }
}
