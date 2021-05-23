import 'package:flutter/foundation.dart';

class NavigationModel {
  final posterUrl;
  final description;
  final releaseDate;
  final String title;
  final double voteAverage;
  final int movieId;

  NavigationModel(
      @required this.posterUrl,
      @required this.description,
      @required this.releaseDate,
      @required this.title,
      @required this.voteAverage,
      @required this.movieId);
}
