import 'package:flutter/material.dart';

import '../models/tmdb_movies.dart';
import '../utils/movie_genre.dart';

class MoviesDetailsScreen extends StatelessWidget {
  static const routeName = '/movie-detail';

  final TmdbMovies moviesDetails;

  MoviesDetailsScreen({required this.moviesDetails});

  Widget buildSectionTitle(BuildContext context, String text) => Container(
        margin: EdgeInsets.symmetric(
            vertical: MediaQuery.of(context).size.width * 0.05),
        child: Text(
          text,
        ),
      );

  @override
  Widget build(BuildContext context) {
    final _height = MediaQuery.of(context).size.height;
    final _width = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('nome filme'),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Stack(
                children: <Widget>[
                  ClipRRect(
                    child: Image.network(
                      'imagem',
                      height: _height * 0.65,
                      width: _width,
                      fit: BoxFit.cover,
                      errorBuilder: (context, exception, stackTrace) =>
                          Container(
                        height: _height * 0.65,
                        width: _width,
                        child: Center(
                          child: Text('The image isn\'t available',
                              style: TextStyle(
                                fontSize: _width * 0.065,
                                color: Colors.black,
                              )),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.all(_width * 0.02),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Icon(
                          Icons.calendar_today,
                        ),
                        SizedBox(
                          width: _width * 0.02,
                        ),
                        Text('lançamento'),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Icon(
                          Icons.tv,
                        ),
                        SizedBox(
                          width: _width * 0.02,
                        ),
                        Text('${listOfGenres.length}'),
                        Divider(),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: _width * 0.1,
              ),
              Padding(
                padding: EdgeInsets.all(_width * 0.02),
                child: Column(
                  children: [
                    Text('About'),
                    Divider(),
                    SizedBox(
                      width: _width * 0.1,
                    ),
                    Text('qualquer coisa aqui'),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
