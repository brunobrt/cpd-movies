import 'package:cpd_movies/models/app_state.dart';
import 'package:cpd_movies/models/tmdb_movies.dart';
import 'package:cpd_movies/redux/actions.dart';
import 'package:redux/redux.dart';

class MoviesScreenViewModel {
  final Store<AppState> store;

  MoviesScreenViewModel(this.store);

  void newMovies() {
    store.dispatch(IsLoadingAction(isLoading: true));
    store.dispatch(FetchNewMovieListAction());
  }

  // void sortMovies() {
  //   store.dispatch(SortMoviesAction(sortMovies: true));
  // }
  //
  // void sortMoviesReversed() {
  //   store.dispatch(SortMoviesReversedAction(sortMoviesReversed: true));
  // }

  List<TmdbMovies> get movies => store.state.movies;
  // List<TmdbMovies> get sortedMovies => store.state.movies
  //     .toList()
  //     .sort((a, b) => a.title!.compareTo(b.title!))
  //     .cast(List<TmdbMovies>);
  bool get isLoading => store.state.isLoading;
  // bool get shouldSort => store.state.shouldSort;
  // bool get shouldSortReversed => store.state.shouldSortReversed;
  bool get hasError => store.state.hasError != null;
}
