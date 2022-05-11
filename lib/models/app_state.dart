import 'package:cpd_movies/models/tmdb_movies.dart';
import 'package:flutter/material.dart';

@immutable
class AppState {
  final List<TmdbMovies> movies;
  final bool isLoading;
  final int currentPage;
  final bool? hasError;

  AppState({
    required this.hasError,
    required this.isLoading,
    required this.currentPage,
    required this.movies,
  });

  factory AppState.initialState() => AppState(
        currentPage: 1,
        isLoading: false,
        movies: [],
        hasError: null,
      );

  AppState copyWith({
    required List<TmdbMovies>? movies,
    required bool? isLoading,
    required int? currentPage,
    required bool? hasError,
  }) =>
      AppState(
        movies: movies ?? this.movies,
        isLoading: isLoading ?? this.isLoading,
        currentPage: currentPage ?? this.currentPage,
        hasError: hasError ?? this.hasError,
      );
}
