import 'package:cpd_movies/models/tmdb_movies.dart';

class FetchNewMovieListAction {}

class IncrementPageAction {
  final int curentPage;

  IncrementPageAction(this.curentPage);
}

class FetchNewMovieListSucceededAction {
  final List<TmdbMovies> newMovieList;

  FetchNewMovieListSucceededAction(this.newMovieList);
}

class FetchNewMovieListFailedAction {
  final bool hasError;

  FetchNewMovieListFailedAction({required this.hasError});
}

class IsLoadingAction {
  final bool isLoading;

  IsLoadingAction({required this.isLoading});
}
