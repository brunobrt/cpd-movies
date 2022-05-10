import 'package:flutter/material.dart';
import 'package:built_collection/built_collection.dart';

Map<int, String> listOfGenres = {
  28: 'Action',
  12: 'Adventure',
  16: 'Animation',
  35: 'Comedy',
  80: 'Crime',
  99: 'Documentary',
  18: 'Drama',
  10751: 'Family',
  14: 'Fantasy',
  36: 'History',
  10402: 'Music',
  9648: 'Mystery',
  10749: 'Romance',
  878: 'Science Fiction',
  10770: 'TV Movie',
  53: 'Thriller',
  10752: 'War',
  37: 'Western'
};

String movieGenreList({required BuiltList<int> ids}) =>
    List<String?>.generate(ids.length, (index) => listOfGenres[ids[index]])
        .first
        .toString();
