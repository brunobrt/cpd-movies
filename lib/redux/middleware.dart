import 'package:cpd_movies/models/tmdb_movie.dart';

import '../models/app_state.dart';
import 'package:redux/redux.dart';
import 'actions.dart';

List<Middleware<AppState>> movieMiddleware() => [
      TypedMiddleware<AppState, FetchNewMovieListAction>(
          _fetchNewMovieMiddleware()),
    ];

Middleware<AppState> _fetchNewMovieMiddleware() => (store, action, next) async {
      store.dispatch(IsLoadingAction(isLoading: true));
      try {
        //add persistence here
        final newMovieList = <TmdbMovies>[];
        store.dispatch(
          FetchNewMovieListSucceededAction(newMovieList),
        );
        store.dispatch(IncrementPageAction(store.state.currentPage));
      } on Exception catch (e) {
        print('_____middleware error: $e');
        store.dispatch(
          FetchNewMovieListFailedAction(hasError: true),
        );
      } finally {
        store.dispatch(IsLoadingAction(isLoading: false));
      }
      next(action);
    };
