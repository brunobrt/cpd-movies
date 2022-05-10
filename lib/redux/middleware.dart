import 'package:cpd_movies/models/app_state.dart';
import 'package:cpd_movies/redux/actions.dart';
import 'package:cpd_movies/repository/movie_repository.dart';
import 'package:redux/redux.dart';

List<Middleware<AppState>> movieMiddleware() => [
      TypedMiddleware<AppState, FetchNewMovieListAction>(
          _fetchNewMovieMiddleware()),
      // TypedMiddleware<AppState, SortMoviesAction>(_sortedMovieMiddleware()),
      // TypedMiddleware<AppState, SortMoviesReversedAction>(
      //     _sortedMovieReversedMiddleware()),
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
        store.dispatch(IsLoadingAction(
          isLoading: false,
        ));
      }
      next(action);
    };

// Middleware<AppState> _sortedMovieMiddleware() =>
//     (store, action, next) => (store, action, next) async {
//           store.dispatch(IsLoadingAction(
//               isLoading: true, shouldSort: true, shouldSortReversed: false));
//           try {
//             final newMovieList =
//                 await MovieRepository().getMovie(store.state.currentPage);
//             newMovieList.sort((a, b) => a.title!.compareTo(b.title!));
//             print(newMovieList);
//             store.dispatch(
//               FetchNewMovieListSucceededAction(newMovieList),
//             );
//           } on Exception catch (e) {
//             print('_____middleware error: $e');
//             store.dispatch(
//               FetchNewMovieListFailedAction(hasError: true),
//             );
//           } finally {
//             store.dispatch(IsLoadingAction(
//                 isLoading: false, shouldSort: true, shouldSortReversed: false));
//           }
//           next(action);
//         };
//
// Middleware<AppState> _sortedMovieReversedMiddleware() =>
//     (store, action, next) => (store, action, next) async {
//           store.dispatch(IsLoadingAction(
//               isLoading: true, shouldSort: false, shouldSortReversed: true));
//           try {
//             final newMovieList =
//                 await MovieRepository().getMovie(store.state.currentPage);
//             newMovieList.sort((a, b) => b.title!.compareTo(a.title!));
//             print(newMovieList);
//             store.dispatch(
//               FetchNewMovieListSucceededAction(newMovieList),
//             );
//             store.dispatch(IncrementPageAction(store.state.currentPage));
//           } on Exception catch (e) {
//             print('_____middleware error: $e');
//             store.dispatch(
//               FetchNewMovieListFailedAction(hasError: true),
//             );
//           } finally {
//             store.dispatch(IsLoadingAction(
//                 isLoading: false, shouldSort: false, shouldSortReversed: true));
//           }
//           next(action);
//         };
