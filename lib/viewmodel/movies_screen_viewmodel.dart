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

  List<TmdbMovies> get movies => store.state.movies;
  bool get isLoading => store.state.isLoading;
  bool get hasError => store.state.hasError != null;
}
