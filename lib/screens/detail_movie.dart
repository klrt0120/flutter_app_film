import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:motchill/models/detail_movie_model.dart';
import 'package:motchill/models/movie_model.dart';
import 'package:motchill/widgets/custom_app_bar.dart';
import 'package:provider/provider.dart';

import '../providers/movies_provider.dart';

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
    final DetailMovieModel detail =
        ModalRoute.of(context)!.settings.arguments as DetailMovieModel;
    final detailFilm = Provider.of<MovieProvide>(context);

    return SafeArea(
        child: Scaffold(
            body: Stack(
      children: [
        SizedBox(
          width: double.infinity,
          child: Image.network("${detail.fullBackdropPath}"),
        ),
        Positioned(
            right: 20,
            top: 25,
            child: Row(
              children: [
                Icon(Icons.search_sharp),
                SizedBox(
                  width: 10,
                ),
                CircleAvatar(
                  child: CircleAvatar(
                      backgroundImage: NetworkImage(
                          "https://picsum.photos/seed/picsum/200/300")),
                )
              ],
            )),
        buttonArrow(context),
        scroll(context, detail),
      ],
    )));
  }

  buttonArrow(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(20.0),
        child: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Container(
              clipBehavior: Clip.hardEdge,
              height: 55,
              width: 55,
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(25)),
              child: Icon(Icons.arrow_back_ios)),
        ));
  }

  scroll(BuildContext context, DetailMovieModel movie) {
    return DraggableScrollableSheet(
        initialChildSize: 0.7,
        maxChildSize: 1.0,
        minChildSize: 0.7,
        builder: (context, scrollController) {
          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20))),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10, bottom: 25),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(height: 5, width: 35, color: Colors.black12),
                    ],
                  ),
                ),
                Text(
                  '${movie.title}',
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 21,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  '(${movie.originalTitle})',
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: TextStyle(
                    fontFamily: "Poppins",
                    fontSize: 15,
                    fontWeight: FontWeight.w300,
                    color: Colors.grey,
                  ),
                ),
                _button(context, "Xem ngay", () => print("Xem ngay"),
                    Icons.play_arrow_outlined),
                    SizedBox(height: 15,) ,
                _button(context, "Xem trailer", () => print("Xem trailer"),
                    Icons.play_circle_outline_outlined)
              ],
            ),
          );
        });
  }

  _button(BuildContext context, String name, Function ontap, IconData icon) {
    return GestureDetector(
      onTap: () {
        ontap();
      },
      child: Container(
        width: MediaQuery.of(context).size.width * 0.9,
        height: 62,
        decoration: BoxDecoration(
            color: HexColor("#BB2649"),
            borderRadius: BorderRadius.all(Radius.circular(8))),
        margin: EdgeInsets.only(right: 5, left: 5),
        child: Center(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 30,),
            SizedBox(width: 5,) ,
            Text(
              "${name}",
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold, color: HexColor("#F8E9ED")),
            ),
          ],
        )),
      ),
    );
  }
}
