import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:cpd_movies/models/tmdb_movies.dart';
import 'package:cpd_movies/serializer/serializers.dart';
import 'package:path_provider/path_provider.dart';

class MovieStorage {
  static Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  static Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/movies.$json');
  }

  static Future<File> writeMovie(List<TmdbMovies> movies) async {
    final file = await _localFile;
    final listMovies = movies
        .map((item) => serializers.serializeWith(TmdbMovies.serializer, item))
        .toList();
    return file.writeAsString(jsonEncode(listMovies));
  }

  static Future<List<TmdbMovies>> readMovie() async {
    try {
      final file = await _localFile;
      String contents = await file.readAsString();
      final jsonMovies = jsonDecode(contents);
      return jsonMovies
          .map((item) =>
              serializers.deserializeWith(TmdbMovies.serializer, item))
          .toList()
          .cast<TmdbMovies>();
    } on Exception catch (e) {
      print('ERROR READING PERSISTENCE: $e');
      return [];
    }
  }
}
