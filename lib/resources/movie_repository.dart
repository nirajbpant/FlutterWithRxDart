import 'package:blocimpl/models/movies.dart';
import 'package:blocimpl/resources/movie_api_provider.dart';


class MovieRepository {
  final MovieApiProvider movieApiProvider = MovieApiProvider();

  Future<MovieModel> getPopularMovies() => movieApiProvider.fetchMovieList();
}
