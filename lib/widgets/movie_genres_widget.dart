import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:motchill/providers/movies_provider.dart';
import 'package:provider/provider.dart';
import "package:flutter/material.dart";

import 'modal_bottomSheet.dart';

class MovieGenres extends StatefulWidget {
  MovieGenres({super.key, required this.getMovieGenres});

  final Function getMovieGenres;
  @override
  State<MovieGenres> createState() => _MovieGenresState();
}

class _MovieGenresState extends State<MovieGenres> {
  void initState() {
    super.initState();
    widget.getMovieGenres();
  }

  @override
  Widget build(BuildContext context) {
    final moviesProvider = Provider.of<MovieProvide>(context);
    print(moviesProvider.onDisplayMoviesGenres);
    return Container(
        height: 500,
        child: CustomScrollView(
          primary: false,
          slivers: <Widget>[
            SliverPadding(
              padding: const EdgeInsets.all(0),
              sliver: SliverGrid.count(
                crossAxisSpacing: 4,
                mainAxisSpacing: 4,
                crossAxisCount: 3,
                childAspectRatio: 1 / 1.5,
                children: <Widget>[
                  ...moviesProvider.onDisplayMoviesGenres.map((e) {
                    return GestureDetector(
                      onTap: () {
                        bottomsheets(context, e, moviesProvider);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            image: DecorationImage(
                                image: NetworkImage("${e.fullPosterImg500}"))),
                        // child: Image(image: NetworkImage(e.fullPosterImg500))
                      ),
                    );
                  }).toList()
                ],
              ),
            ),
          ],
        ));
    // return Container(
    //   child: Column(
    //     children: [
    //       ...moviesProvider.onDisplayMoviesGenres.map((e) {
    //         return Image(image: NetworkImage(e.) );
    //       }).toList()
    //     ],
    //   )
    // );
  }
}
