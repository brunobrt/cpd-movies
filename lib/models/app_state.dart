import 'package:cpd_movies/models/tmdb_movies.dart';
import 'package:flutter/material.dart';

@immutable
class AppState {
  final List<TmdbMovies> movies;
  final bool isLoading;
  final int currentPage;
  final bool? hasError;
  // final bool shouldSort;
  // final bool shouldSortReversed;

  AppState({
    required this.hasError,
    required this.isLoading,
    required this.currentPage,
    required this.movies,
    // required this.shouldSort,
    // required this.shouldSortReversed,
  });

  factory AppState.initialState() => AppState(
        currentPage: 1,
        isLoading: false,
        movies: [],
        hasError: null,
        // shouldSort: false,
        // shouldSortReversed: false,
      );

  AppState copyWith({
    required List<TmdbMovies>? movies,
    required bool? isLoading,
    required int? currentPage,
    required bool? hasError,
    // required bool? shouldSort,
    // required bool? shouldSortReversed,
  }) =>
      AppState(
        movies: movies ?? this.movies,
        isLoading: isLoading ?? this.isLoading,
        currentPage: currentPage ?? this.currentPage,
        hasError: hasError ?? this.hasError,
        // shouldSort: shouldSort ?? this.shouldSort,
        // shouldSortReversed: shouldSortReversed ?? this.shouldSortReversed,
      );
}
