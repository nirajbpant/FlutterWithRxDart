import 'package:blocimpl/blocs/movies_bloc.dart';
import 'package:blocimpl/models/movies.dart';
import 'package:blocimpl/models/nav_detailpage_model.dart';
import 'package:blocimpl/navigation/app_nav_config.dart';
import 'package:flutter/material.dart';
import '../constants/global_constants.dart' as constants;

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
          builder: (context, AsyncSnapshot<MovieModel> snapshot) {
            if (snapshot.hasData) {
              return buildList(snapshot);
            } else if (snapshot.hasError) {
              return Text(snapshot.hasError.toString());
            }
            return Center(
              child: CircularProgressIndicator(),
            );
          }),
    );
  }

  Widget buildList(AsyncSnapshot<MovieModel> snapshot) {
    final apiData= snapshot.data.results;
    return GridView.builder(
        itemCount: apiData.length,
        gridDelegate:
            new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (BuildContext context, int index) {
          return GridTile(
            child: InkResponse(
              enableFeedback: true,
              child: Image.network(
                constants.imageUrl,
                fit: BoxFit.contain,
              ),
              onTap: ()=> jumpToDetailsPage(
                context: context,
                model: new NavigationModel(
                  constants.imageUrl,
                   apiData[index].overview, 
                   apiData[index].releaseDate, 
                   apiData[index].title, 
                   apiData[index].voteAverage,
                   apiData[index].id)
                ),
            ),
          );
        });
  }
}
