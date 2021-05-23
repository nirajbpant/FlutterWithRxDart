import 'package:blocimpl/models/movies.dart';
import 'package:blocimpl/resources/movie_repository.dart';
import 'package:rxdart/rxdart.dart';

class MovieBloc{

  final _repository = MovieRepository();
  final _movieFetcher = PublishSubject<MovieModel>();

   Stream<MovieModel> get allMovies => _movieFetcher.stream;

  fetchAllMovies() async {
    MovieModel model = await _repository.getPopularMovies();
    _movieFetcher.sink.add(model);
  }

  dispose(){
    _movieFetcher.close();
  }

}

class Observable {
}
final movieBloc = MovieBloc();