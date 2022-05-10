class Movie {
  final String backdropPath;
  final String posterPath;
  final String title;
  final List<int> genreIds;
  final DateTime releaseData;
  final int id;
  final String overview;

  const Movie({
    required this.backdropPath,
    required this.posterPath,
    required this.title,
    required this.genreIds,
    required this.releaseData,
    required this.id,
    required this.overview,
  });
}
