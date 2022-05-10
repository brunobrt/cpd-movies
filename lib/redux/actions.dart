import 'package:cpd_movies/models/tmdb_movies.dart';

class FetchNewMovieListAction {}

class IncrementPageAction {
  final int currentPage;

  IncrementPageAction(this.currentPage);
}

class FetchNewMovieListSucceededAction {
  final List<TmdbMovies> newMovieList;

  FetchNewMovieListSucceededAction(this.newMovieList);
}

class FetchNewMovieListFailedAction {
  final bool hasError;

  FetchNewMovieListFailedAction({required this.hasError});
}
//
// class SortMoviesAction {
//   final bool sortMovies;
//
//   SortMoviesAction({required this.sortMovies});
// }
//
// class SortMoviesReversedAction {
//   final bool sortMoviesReversed;
//
//   SortMoviesReversedAction({required this.sortMoviesReversed});
// }

class IsLoadingAction {
  final bool isLoading;
  // final bool shouldSort;
  // final bool shouldSortReversed;

  IsLoadingAction({
    required this.isLoading,
    // required this.shouldSort,
    // required this.shouldSortReversed
  });
}
