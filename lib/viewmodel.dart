import 'package:cpd_movies/redux/actions.dart';

import 'models/app_state.dart';
import 'models/tmdb_movie.dart';
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
