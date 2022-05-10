import 'package:cpd_movies/models/app_state.dart';
import 'package:cpd_movies/redux/actions.dart';
import 'package:cpd_movies/repository/movie_repository.dart';
import 'package:redux/redux.dart';

List<Middleware<AppState>> movieMiddleware() => [
      TypedMiddleware<AppState, FetchNewMovieListAction>(
          _fetchNewMovieMiddleware()),
    ];

Middleware<AppState> _fetchNewMovieMiddleware() => (store, action, next) async {
      store.dispatch(IsLoadingAction(isLoading: true));
      try {
        final newMovieList =
            await MovieRepository().getMovie(store.state.currentPage);
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
