import 'package:cpd_movies/redux/middleware.dart';
import 'package:cpd_movies/redux/reducer.dart';
import 'package:cpd_movies/screens/movies_screen.dart';
import 'package:cpd_movies/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

import 'models/app_state.dart';

final _appStore = Store<AppState>(updateMoviesReducer,
    initialState: AppState.initialState(), middleware: movieMiddleware());

void main() => runApp(CPDMovie());

class CPDMovie extends StatelessWidget {
  @override
  Widget build(BuildContext context) => StoreProvider(
        store: _appStore,
        child: MaterialApp(
          title: 'CPD Movie',
          theme: kThemeApp,
          home: MoviesScreen(),
        ),
      );
}
