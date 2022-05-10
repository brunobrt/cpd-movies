// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tmdb_movie.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<TmdbMovies> _$tmdbMoviesSerializer = new _$TmdbMoviesSerializer();

class _$TmdbMoviesSerializer implements StructuredSerializer<TmdbMovies> {
  @override
  final Iterable<Type> types = const [TmdbMovies, _$TmdbMovies];
  @override
  final String wireName = 'TmdbMovies';

  @override
  Iterable<Object?> serialize(Serializers serializers, TmdbMovies object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.id;
    if (value != null) {
      result
        ..add('id')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.backdropPath;
    if (value != null) {
      result
        ..add('backdrop_path')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.genreIds;
    if (value != null) {
      result
        ..add('genre_ids')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(int)])));
    }
    value = object.overview;
    if (value != null) {
      result
        ..add('overview')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.posterPath;
    if (value != null) {
      result
        ..add('poster_path')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.releaseDate;
    if (value != null) {
      result
        ..add('release_date')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.title;
    if (value != null) {
      result
        ..add('title')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  TmdbMovies deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new TmdbMoviesBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'backdrop_path':
          result.backdropPath = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'genre_ids':
          result.genreIds.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(int)]))!
              as BuiltList<Object?>);
          break;
        case 'overview':
          result.overview = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'poster_path':
          result.posterPath = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'release_date':
          result.releaseDate = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'title':
          result.title = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
      }
    }

    return result.build();
  }
}

class _$TmdbMovies extends TmdbMovies {
  @override
  final int? id;
  @override
  final String? backdropPath;
  @override
  final BuiltList<int>? genreIds;
  @override
  final String? overview;
  @override
  final String? posterPath;
  @override
  final String? releaseDate;
  @override
  final String? title;

  factory _$TmdbMovies([void Function(TmdbMoviesBuilder)? updates]) =>
      (new TmdbMoviesBuilder()..update(updates))._build();

  _$TmdbMovies._(
      {this.id,
      this.backdropPath,
      this.genreIds,
      this.overview,
      this.posterPath,
      this.releaseDate,
      this.title})
      : super._();

  @override
  TmdbMovies rebuild(void Function(TmdbMoviesBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  TmdbMoviesBuilder toBuilder() => new TmdbMoviesBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is TmdbMovies &&
        id == other.id &&
        backdropPath == other.backdropPath &&
        genreIds == other.genreIds &&
        overview == other.overview &&
        posterPath == other.posterPath &&
        releaseDate == other.releaseDate &&
        title == other.title;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc($jc($jc(0, id.hashCode), backdropPath.hashCode),
                        genreIds.hashCode),
                    overview.hashCode),
                posterPath.hashCode),
            releaseDate.hashCode),
        title.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('TmdbMovies')
          ..add('id', id)
          ..add('backdropPath', backdropPath)
          ..add('genreIds', genreIds)
          ..add('overview', overview)
          ..add('posterPath', posterPath)
          ..add('releaseDate', releaseDate)
          ..add('title', title))
        .toString();
  }
}

class TmdbMoviesBuilder implements Builder<TmdbMovies, TmdbMoviesBuilder> {
  _$TmdbMovies? _$v;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  String? _backdropPath;
  String? get backdropPath => _$this._backdropPath;
  set backdropPath(String? backdropPath) => _$this._backdropPath = backdropPath;

  ListBuilder<int>? _genreIds;
  ListBuilder<int> get genreIds => _$this._genreIds ??= new ListBuilder<int>();
  set genreIds(ListBuilder<int>? genreIds) => _$this._genreIds = genreIds;

  String? _overview;
  String? get overview => _$this._overview;
  set overview(String? overview) => _$this._overview = overview;

  String? _posterPath;
  String? get posterPath => _$this._posterPath;
  set posterPath(String? posterPath) => _$this._posterPath = posterPath;

  String? _releaseDate;
  String? get releaseDate => _$this._releaseDate;
  set releaseDate(String? releaseDate) => _$this._releaseDate = releaseDate;

  String? _title;
  String? get title => _$this._title;
  set title(String? title) => _$this._title = title;

  TmdbMoviesBuilder();

  TmdbMoviesBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _backdropPath = $v.backdropPath;
      _genreIds = $v.genreIds?.toBuilder();
      _overview = $v.overview;
      _posterPath = $v.posterPath;
      _releaseDate = $v.releaseDate;
      _title = $v.title;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(TmdbMovies other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$TmdbMovies;
  }

  @override
  void update(void Function(TmdbMoviesBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  TmdbMovies build() => _build();

  _$TmdbMovies _build() {
    _$TmdbMovies _$result;
    try {
      _$result = _$v ??
          new _$TmdbMovies._(
              id: id,
              backdropPath: backdropPath,
              genreIds: _genreIds?.build(),
              overview: overview,
              posterPath: posterPath,
              releaseDate: releaseDate,
              title: title);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'genreIds';
        _genreIds?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'TmdbMovies', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
