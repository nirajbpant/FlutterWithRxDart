import 'package:blocimpl/blocs/movies_bloc.dart';
import 'package:blocimpl/models/movies.dart';
import 'package:flutter/material.dart';

class MovieList extends StatefulWidget {
  const MovieList({Key key}) : super(key: key);

  @override
  _MovieListState createState() => _MovieListState();
}

class _MovieListState extends State<MovieList> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    movieBloc.fetchAllMovies();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    movieBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Famous Movie List'), 
      ),
      body: StreamBuilder(
        stream: movieBloc.allMovies,
        builder: (context, AsyncSnapshot<MovieModel> snapshot){
          if(snapshot.hasData){
            return buildList(snapshot);
          }else if(snapshot.hasError){
            return Text(snapshot.hasError.toString());
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      ),
    ); 
  }

  Widget buildList(AsyncSnapshot<MovieModel> snapshot){
    return GridView.builder(
      itemCount: snapshot.data.results.length,
      gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2), 
      itemBuilder: (BuildContext context, int index){
         return Stack(
           children: [
             Image.network(
                'https://image.tmdb.org/t/p/w185${snapshot.data
                    .results[index].posterPath}',
                fit: BoxFit.cover,
              ),
              Text(snapshot.data.results[index].title),
           ],
         );

      });
  }
}