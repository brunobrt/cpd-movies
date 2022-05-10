import 'package:cpd_movies/models/tmdb_movies.dart';
import 'package:cpd_movies/services/api.dart';

import 'movie_storage.dart';

class MovieRepository {
  Future<List<TmdbMovies>> readStorage() {
    try {
      return MovieStorage.readMovie().then((movie) => movie);
    } on Exception catch (e) {
      print('ERROR READING PERSISTENCE: $e');
      return Future.value([]);
    }
  }

  Future<List<TmdbMovies>> getMovie(int page) async {
    final list = await movieList(page: page);
    if (list.isEmpty) {
      return readStorage();
    }
    saveMovie(list);
    return list;
  }
}

void saveMovie(List<TmdbMovies> list) => MovieStorage.writeMovie(list);
