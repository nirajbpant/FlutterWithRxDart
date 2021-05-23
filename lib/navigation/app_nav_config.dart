import 'package:blocimpl/models/nav_detailpage_model.dart';
import 'package:blocimpl/screens/movie_detail.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

jumpToDetailsPage({
  @required BuildContext context,
  @required NavigationModel model,
}) {
  Navigator.push(
    context,
    CupertinoPageRoute(
      builder: (context) => MovieDetail(
        navigationModel: model,
      ),
    ),
  );
}
