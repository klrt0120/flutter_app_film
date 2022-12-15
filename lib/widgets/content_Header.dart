import 'package:flutter/material.dart';
import 'package:motchill/core/routes/routes.dart';
import 'package:motchill/models/movie_model.dart';
import 'package:motchill/screens/detail_movie.dart';
import 'package:motchill/widgets/iconButton_widget.dart';
import 'package:motchill/widgets/modal_bottomSheet.dart';
import 'package:provider/provider.dart';

import '../providers/movies_provider.dart';

class ContentHeader extends StatelessWidget {
  final Movie featuredContent;

  const ContentHeader({Key? key, required this.featuredContent})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final videoProvider = Provider.of<MovieProvide>(context);
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          height: 500.0,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(featuredContent.fullPosterImg),
              fit: BoxFit.cover,
            ),
          ),
        ),
        GestureDetector(
          /*onTap: () => Navigator.pushNamed(context, "/detail_movie",
              arguments: featuredContent)*/
          onTap: () {
            print(featuredContent.title.toString());
            // videoProvider.getVideo("Povie", featuredContent.id.toString());

            bottomsheets(context, featuredContent , videoProvider);
          },
          child: Container(
            height: 500.0,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.black, Colors.transparent],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
              ),
            ),
          ),
        ),
        Positioned(
            left: 0,
            right: 0,
            bottom: 40.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                VerticalIconButton(
                    icon: Icons.add,
                    title: "Danh sách",
                    onTap: () => print("Danh sách")),
                _PlayButton(
                    category: "movie", movieId: featuredContent.id.toString()),
                VerticalIconButton(
                    icon: Icons.info_outline,
                    title: "Thông tin",
                    onTap: () => print("Thông tin ")),
              ],
            )),
      ],
    );
  }
}

class _PlayButton extends StatelessWidget {
  final String movieId;

  final String category;

  const _PlayButton({Key? key, required this.category, required this.movieId})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final videoProvider = Provider.of<MovieProvide>(context);

    return GestureDetector(
      onTap: () {
        print("Video");
        print(videoProvider.dataVideos);
      },
      child: Container(
        padding: EdgeInsets.only(right: 10, left: 5, top: 5, bottom: 5),
        color: Colors.white,
        child: Row(
          children: [
            Icon(
              Icons.play_arrow,
              size: 30.0,
              color: Colors.black,
            ),
            Text(
              "Xem ngay",
              style: TextStyle(color: Colors.black),
            )
          ],
        ),
      ),
    );
  }
}
