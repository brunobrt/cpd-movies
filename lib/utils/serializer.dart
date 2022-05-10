import 'package:built_collection/built_collection.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:cpd_movies/models/tmdb_movie.dart';

part 'serializer.g.dart';

@SerializersFor([
  TmdbMovies,
])
final Serializers serializers =
    (_$serializers.toBuilder()..addPlugin(StandardJsonPlugin())).build();
