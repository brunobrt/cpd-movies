import 'package:cpd_movies/models/app_state.dart';
import 'package:cpd_movies/redux/actions.dart';
import 'package:cpd_movies/viewmodel/movies_screen_viewmodel.dart';
import 'package:cpd_movies/widgets/movie_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

class MoviesScreen extends StatefulWidget {
  static const routeName = '/movies';

  @override
  _MoviesScreenState createState() => _MoviesScreenState();
}

class _MoviesScreenState extends State<MoviesScreen> {
  final _controller = ScrollController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext ctx) => SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Center(
              child: const Text(
                'CPD Movies',
              ),
            ),
          ),
          body: Center(
            child: StoreConnector<AppState, MoviesScreenViewModel>(
              onInit: (store) {
                store.dispatch(FetchNewMovieListAction());
                _controller.addListener(
                  () {
                    if (_controller.position.pixels ==
                        _controller.position.maxScrollExtent) {
                      store.dispatch(FetchNewMovieListAction());
                    }
                  },
                );
              },
              converter: (store) => MoviesScreenViewModel(store),
              builder: (ctx, vm) => ListView.builder(
                controller: _controller,
                itemCount: vm.movies.length,
                itemBuilder: (ctx, index) => MovieItem(
                  index: index,
                  movieData: vm.movies,
                ),
              ),
            ),
          ),
        ),
      );
}
