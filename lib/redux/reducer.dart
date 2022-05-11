import 'package:cpd_movies/models/app_state.dart';
import 'package:cpd_movies/models/tmdb_movies.dart';
import 'package:redux/redux.dart';

import 'actions.dart';

AppState updateMoviesReducer(AppState currentState, action) =>
    currentState.copyWith(
      isLoading: _isLoadingReducer(currentState.isLoading, action),
      hasError: _hasErrorReducer(currentState.hasError, action),
      movies: _moviesReducer(currentState.movies, action),
      currentPage: _currentPageReducer(currentState.currentPage, action),
    );

final _currentPageReducer = combineReducers<int>(
  [
    TypedReducer<int, IncrementPageAction>(_incrementPageReducer),
  ],
);

int _incrementPageReducer(int currentPage, _) => currentPage += 1;

final _moviesReducer = combineReducers<List<TmdbMovies>>(
  [
    TypedReducer<List<TmdbMovies>, FetchNewMovieListSucceededAction>(
        _fetchNewMovieListSucceededReducer),
  ],
);

List<TmdbMovies> _fetchNewMovieListSucceededReducer(
        List<TmdbMovies> movies, action) =>
    movies..addAll(action.newMovieList);

final _isLoadingReducer = combineReducers<bool>(
  [
    TypedReducer<bool, IsLoadingAction>(_startLoadingReducer),
  ],
);

bool _startLoadingReducer(currentState, action) => action.isLoading;

final _hasErrorReducer = combineReducers<bool?>(
  [
    TypedReducer<bool?, FetchNewMovieListFailedAction>(
        _fetchNewMovieListFailedReducer),
  ],
);

bool? _fetchNewMovieListFailedReducer(currentState, action) => action.hasError;
