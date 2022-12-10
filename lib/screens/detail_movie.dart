import 'package:flutter/material.dart';
import 'package:motchill/models/movie_model.dart';
import 'package:motchill/widgets/custom_app_bar.dart';

class DetailMovieView extends StatefulWidget {
  const DetailMovieView({Key? key}) : super(key: key);
/*  final Movie movie;*/
  static const String routeName = 'detail_movie';

  @override
  State<DetailMovieView> createState() => _DetailMovieViewState();
}

class _DetailMovieViewState extends State<DetailMovieView> {
  @override
  Widget build(BuildContext context) {
    final Movie movie = ModalRoute.of(context)!.settings.arguments as Movie;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(MediaQuery.of(context).size.width, 100.0),
        child: Text("${movie.title}"),
      ),
    );
  }
}
