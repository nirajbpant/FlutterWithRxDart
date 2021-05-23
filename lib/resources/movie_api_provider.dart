import 'dart:convert';
import 'package:http/http.dart' show Client;
import 'package:blocimpl/models/movies.dart';

class MovieApiProvider{

  Client client= Client();
  final _apiKey= '802b2c4b88ea1183e50e6b285a27696e';

  Future<MovieModel> fetchMovieList() async {

    print("Entered");
   final response = await client
        .get(Uri.parse("http://api.themoviedb.org/3/movie/popular?api_key=$_apiKey"));
    print(response);

    print(response.body.toString());

    if(response.statusCode == 200){
      return MovieModel.fromJson(json.decode(response.body));
    }else {
      throw Exception('Failed to load data');
    }

  }

}