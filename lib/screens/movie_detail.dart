import 'package:blocimpl/models/nav_detailpage_model.dart';
import 'package:flutter/material.dart';

class MovieDetail extends StatefulWidget {

  final NavigationModel navigationModel;

  const MovieDetail({
    Key key, this.navigationModel, }) : super(key: key);

  @override
  _MovieDetailState createState() => _MovieDetailState();
}

class _MovieDetailState extends State<MovieDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: false,
        bottom: false,
        child: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled){
            return <Widget>[
              SliverAppBar(
                expandedHeight: 200.0,
                floating: false,
                pinned: true,
                elevation: 0.0,
                flexibleSpace: FlexibleSpaceBar(
                  background: Image.network(
                    'https://www.tbsnews.net/sites/default/files/styles/big_3/public/images/2021/05/10/netflix-logo_jpg.jpg?itok=hr7lolIl&timestamp=1620628420',
                    fit: BoxFit.cover,
                    )
                ),
              ),
            ];
          },
          body: Column(
            
          ),
        ),
      ),
    );
  }
}