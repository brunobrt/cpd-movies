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
  final _scrollController = ScrollController();
  final _textEditingController = TextEditingController();
  String _searchedMovie = '';
  Icon _customIcon = const Icon(Icons.search);
  Widget _customSearchBar = const Text('CPD Movies');

  @override
  void dispose() {
    _scrollController.dispose();
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext ctx) => SafeArea(
        child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            centerTitle: true,
            actions: [
              IconButton(
                onPressed: () {
                  setState(() {
                    if (_customIcon.icon == Icons.search) {
                      _customIcon = const Icon(Icons.cancel);
                      _customSearchBar = ListTile(
                        leading: Icon(
                          Icons.search,
                          color: Colors.white,
                          size: 28,
                        ),
                        title: TextField(
                          decoration: InputDecoration(
                            hintText: 'Escreva o nome do filme',
                            hintStyle: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontStyle: FontStyle.italic,
                            ),
                            border: InputBorder.none,
                          ),
                          style: TextStyle(
                            color: Colors.white,
                          ),
                          controller: _textEditingController,
                        ),
                      );
                      _searchedMovie = _textEditingController.text;
                    } else {
                      _customIcon = const Icon(Icons.search);
                      _customSearchBar = const Text('CPD Movies');
                    }
                  });
                },
                icon: _customIcon,
              ),
            ],
            title: _customSearchBar,
          ),
          body: Center(
            child: StoreConnector<AppState, MoviesScreenViewModel>(
              onInit: (store) {
                store.dispatch(FetchNewMovieListAction());
                _scrollController.addListener(
                  () {
                    if (_scrollController.position.pixels ==
                        _scrollController.position.maxScrollExtent) {
                      store.dispatch(FetchNewMovieListAction());
                    }
                  },
                );
              },
              converter: (store) => MoviesScreenViewModel(store),
              builder: (ctx, vm) => ListView.builder(
                controller: _scrollController,
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
