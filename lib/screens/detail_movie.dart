import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:motchill/models/detail_movie_model.dart';
import 'package:motchill/models/movie_model.dart';
import 'package:motchill/widgets/custom_app_bar.dart';
import 'package:motchill/widgets/iconButton_widget.dart';
import 'package:motchill/widgets/movie_genres_widget.dart';
import 'package:provider/provider.dart';

import '../core/routes/routes.dart';
import '../providers/movies_provider.dart';
import '../utils/helper.dart';

class DetailMovieView extends StatefulWidget {
  const DetailMovieView({Key? key}) : super(key: key);
/*  final Movie movie;*/
  static const String routeName = 'detail_movie';

  @override
  State<DetailMovieView> createState() => _DetailMovieViewState();
}

class _DetailMovieViewState extends State<DetailMovieView> {
  late String genres = "";

  @override
  Widget build(BuildContext context) {
    // String genres ="" ;
    final arg = ModalRoute.of(context)!.settings.arguments as Map;
    DetailMovieModel detail = arg["detail"];
    final Movie movie = arg.containsKey("movie") ? arg["movie"] : [];
    // final DetailMovieModel detail =
    //     ModalRoute.of(context)!.settings.arguments as DetailMovieModel;
    final video = Provider.of<MovieProvide>(context);

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
        scroll(context, detail, movie, video),
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

  scroll(BuildContext context, DetailMovieModel movieItem, Movie movie,
      MovieProvide video) {
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
            child: SingleChildScrollView(
              controller: scrollController,
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
                    '${movieItem.title}',
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 21,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    '(${movieItem.originalTitle})',
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: TextStyle(
                      fontFamily: "Poppins",
                      fontSize: 15,
                      fontWeight: FontWeight.w300,
                      color: Colors.grey,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      Text(
                        '${movieItem.releaseYear}  ',
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: TextStyle(
                          fontFamily: "Poppins",
                          fontSize: 15,
                          fontWeight: FontWeight.w300,
                          color: Colors.grey,
                        ),
                      ),
                      Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 13, vertical: 3),
                        decoration: BoxDecoration(
                            color: Colors.greenAccent,
                            borderRadius: BorderRadius.all(Radius.circular(8))),
                        child: Text(
                          '${movieItem.isadult}',
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: TextStyle(
                            fontFamily: "Poppins",
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        '${movieItem.ConvertRunTime}  ',
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: TextStyle(
                          fontFamily: "Poppins",
                          fontSize: 15,
                          fontWeight: FontWeight.w300,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      ...movieItem.genres!.asMap().entries.map((e) {
                        int idx = e.key;
                        Genre val = e.value;
                        if (idx == 0) {
                          genres = val.id.toString();
                          return Text(
                            '${val.name!.substring(4, val.name!.length)}  ',
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            style: const TextStyle(
                              fontFamily: "Poppins",
                              fontSize: 13,
                              fontWeight: FontWeight.w300,
                              color: Colors.grey,
                            ),
                          );
                        }
                        return Text(
                          '- ${val.name!.substring(4, val.name!.length)}  ',
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: const TextStyle(
                            fontFamily: "Poppins",
                            fontSize: 13,
                            fontWeight: FontWeight.w300,
                            color: Colors.grey,
                          ),
                        );
                      }).toList()
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  _button(context, "Xem ngay", () {
                    Navigator.pushNamed(context, AppRoutes.TrailerRoutes,
                        arguments: {
                          "id": movie.id.toString(),
                          "action": "watch_now",
                          "category": "movie",
                        });
                  }, Icons.play_arrow_outlined, "#BB2649"),
                  SizedBox(
                    height: 15,
                  ),
                  _button(context, "Xem trailer", () {
                    fetchDataVideoTrailer("movie", movie.id.toString(), () {
                      Navigator.pushNamed(context, AppRoutes.TrailerRoutes,
                          arguments: {
                            "video": video.dataVideos,
                            "id": movie.id.toString(),
                            "action": "trailer",
                          });
                    }, video);
                  }, Icons.play_circle_outline_outlined, "#000"),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'NỘI DUNG PHIM',
                    textAlign: TextAlign.justify,
                    style: const TextStyle(
                        // fontFamily: "Poppins",
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    '${!movie.overview.toString().isEmpty ? movie.overview : "Chưa có nội dung"}',
                    textAlign: TextAlign.justify,
                    style: const TextStyle(
                        fontFamily: "Poppins",
                        fontSize: 16,
                        color: Colors.black,
                        fontWeight: FontWeight.w300),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: [
                      VerticalIconButton(
                          color: "#000000",
                          icon: Icons.add_box_outlined,
                          title: "Danh sách",
                          onTap: () => print("Danh sách")),
                      SizedBox(
                        width: 20,
                      ),
                      VerticalIconButton(
                          color: "#000000",
                          icon: Icons.share,
                          title: "Chia sẻ",
                          onTap: () => print("Chia sẻ")),
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 10),
                    decoration: BoxDecoration(
                      border: Border(
                        top: BorderSide(
                          color: HexColor("#BB2649"),
                          width: 4.0,
                        ),
                      ),
                    ),
                    child: const Text(
                      'PHIM CÙNG THỂ LOẠI',
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                          // fontFamily: "Poppins",
                          fontSize: 20,
                          color: Colors.black,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  MovieGenres(
                      getMovieGenres: () =>
                          video.getGenresFilm("movie", genres))
                ],
              ),
            ),
          );
        });
  }

  _button(BuildContext context, String name, Function ontap, IconData icon,
      String color) {
    return GestureDetector(
      onTap: () {
        ontap();
      },
      child: Container(
        width: MediaQuery.of(context).size.width * 0.9,
        height: 62,
        decoration: BoxDecoration(
            color: HexColor("${color}"),
            borderRadius: BorderRadius.all(Radius.circular(8))),
        margin: EdgeInsets.only(right: 5, left: 5),
        child: Center(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 30,
            ),
            const SizedBox(
              width: 5,
            ),
            Text(
              "${name}",
              style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                  color: HexColor("#F8E9ED")),
            ),
          ],
        )),
      ),
    );
  }
}
