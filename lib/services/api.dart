import 'dart:async';
import 'dart:convert';

import 'package:cpd_movies/models/tmdb_movies.dart';
import 'package:cpd_movies/serializer/serializers.dart';
import 'package:cpd_movies/utilities/constants.dart';
import 'package:http/http.dart' as http;

Future<List<TmdbMovies>> movieList({required int page}) async {
  final _baseUrls = '${Constants.baseUrl}=$page';

  try {
    final response = await http.get(Uri.parse(_baseUrls));
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
  } on Exception catch (error) {
    print('_____getting data error: $error');
    return [];
  }
}
