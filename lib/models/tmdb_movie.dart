import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import '../utils/serializer.dart';

part 'tmdb_movie.g.dart';

abstract class TmdbMovies implements Built<TmdbMovies, TmdbMoviesBuilder> {
  int? get id;

  @BuiltValueField(wireName: 'backdrop_path')
  String? get backdropPath;

  @BuiltValueField(wireName: 'genre_ids')
  BuiltList<int>? get genreIds;

  String? get overview;

  @BuiltValueField(wireName: 'poster_path')
  String? get posterPath;

  @BuiltValueField(wireName: 'release_date')
  String? get releaseDate;

  String? get title;

  factory TmdbMovies([void Function(TmdbMoviesBuilder b) updates]) =
      _$TmdbMovies;

  TmdbMovies._();
  static Serializer<TmdbMovies> get serializer => _$tmdbMoviesSerializer;

  String toJson() =>
      json.encode(serializers.serializeWith(TmdbMovies.serializer, this));

  static TmdbMovies? fromJson(String jsonString) => serializers.deserializeWith(
      TmdbMovies.serializer, json.decode(jsonString));
}
