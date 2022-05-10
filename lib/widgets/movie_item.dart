import 'package:auto_size_text/auto_size_text.dart';
import 'package:cpd_movies/models/tmdb_movies.dart';
import 'package:cpd_movies/screens/movies_details_screen.dart';
import 'package:cpd_movies/utilities/constants.dart';
import 'package:flutter/material.dart';

import './movie_genre.dart';

class MovieItem extends StatelessWidget {
  final List<TmdbMovies> movieData;
  final int index;

  const MovieItem({
    required this.index,
    required this.movieData,
  });

  @override
  Widget build(BuildContext ctx) {
    final _height = MediaQuery.of(ctx).size.height;
    final _width = MediaQuery.of(ctx).size.width;

    return InkWell(
      onTap: () => Navigator.push(
        ctx,
        MaterialPageRoute(
          builder: (context) =>
              MoviesDetailsScreen(moviesDetails: movieData[index]),
        ),
      ),
      splashColor: Theme.of(ctx).colorScheme.secondary,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(Constants.radius),
        ),
        elevation: 4,
        margin: EdgeInsets.all(_height * 0.01),
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(Constants.radius),
                    topRight: Radius.circular(Constants.radius),
                  ),
                  child: Image.network(
                    '${Constants.imageUrl}${movieData[index].posterPath}',
                    height: _height * 0.65,
                    width: _width,
                    fit: BoxFit.cover,
                    errorBuilder: (context, exception, stackTrace) => Container(
                      height: _height * 0.65,
                      width: _width,
                      child: Center(
                        child: Text(
                          'The image isn\'t available',
                          style: TextStyle(
                            fontSize: _width * 0.065,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: _height * 0.05,
                  right: _width * 0.01,
                  child: Container(
                    width: _width * 0.6,
                    color: Colors.black54,
                    padding: EdgeInsets.symmetric(
                      vertical: _height * 0.01,
                      horizontal: _width * 0.05,
                    ),
                    child: Text(
                      '${movieData[index].title}',
                      style: TextStyle(
                        fontSize: _width * 0.065,
                        color: Colors.white,
                      ),
                      softWrap: true,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.all(_width * 0.05),
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
                      Text('${movieData[index].releaseDate}'),
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
                      AutoSizeText(
                        '${movieGenreList(ids: movieData[index].genreIds!)}',
                        maxLines: 3,
                        softWrap: true,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
