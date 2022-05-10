import 'package:cpd_movies/models/app_state.dart';
import 'package:cpd_movies/redux/middleware.dart';
import 'package:cpd_movies/redux/reducer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

import './screens/movies_screen.dart';
import './utilities/theme.dart';

final _appStore = Store<AppState>(updateMoviesReducer,
    initialState: AppState.initialState(), middleware: movieMiddleware());

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) => StoreProvider(
        store: _appStore,
        child: MaterialApp(
          title: 'CPD Movies',
          theme: kThemeApp,
          home: MoviesScreen(),
        ),
      );
}
