import 'package:flutter/material.dart';
import 'package:motchill/core/routes/routes.dart';
import 'package:motchill/models/video_model.dart';
import 'package:motchill/providers/movies_provider.dart';
import 'package:motchill/widgets/iconButton_widget.dart';
import 'package:provider/provider.dart';

import '../models/movie_model.dart';
import '../screens/trailer.dart';

void bottomsheets(context, Movie movies, MovieProvide video) {
  // Hàm fetch data film theo id
  final String id;
  final String action = "watch_now";
  final String category = "movie";
  // Phải xử lý bottom với tv shows ...
  Future<void> fetchDataVideoTrailer(String id, Function router_func) async {
    print('Dữ liệu đang tải...');

    var respon = await video.getVideo(category, id);
    router_func();
  }

  showModalBottomSheet<void>(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20),
        ),
      ),
      builder: (BuildContext context) {
        return Container(
          decoration: const BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.all(
              Radius.circular(5000),
            ),
          ),
          padding: EdgeInsets.only(top: 10, left: 20, right: 20, bottom: 10),
          height: MediaQuery.of(context).size.height * 0.4,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    child: const Icon(Icons.close),
                    onTap: () => Navigator.pop(context),
                  ),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /* Image(
                      image: NetworkImage("${movies.fullPosterImg}"),
                      width: MediaQuery.of(context).size.width * 0.3),*/
                  FadeInImage(
                      placeholder: AssetImage("assets/images/no-image.jpg"),
                      image: NetworkImage(movies.fullPosterImg),
                      fit: BoxFit.cover,
                      width: MediaQuery.of(context).size.width * 0.3),
                  const SizedBox(
                    width: 15,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width * 0.5,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.5,
                                  child: Text(
                                    '${movies.title}',
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 2,
                                    style: const TextStyle(
                                        fontFamily: "Poppins",
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                              ],
                            ),
                            Text(
                              '(${movies.originalTitle})',
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              style: TextStyle(
                                  fontFamily: "Poppins",
                                  fontSize: 11,
                                  fontWeight: FontWeight.w300),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 5),
                        width: MediaQuery.of(context).size.width * 0.5,
                        child: Text(
                          '${!movies.overview.toString().isEmpty ? movies.overview : "Chưa có nội dung"}',
                          overflow: TextOverflow.ellipsis,
                          maxLines: 5,
                          textAlign: TextAlign.justify,
                          style: const TextStyle(
                              fontFamily: "Poppins",
                              fontSize: 10,
                              color: Colors.white,
                              fontWeight: FontWeight.w300),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  VerticalIconButton(
                      icon: Icons.play_circle,
                      title: "Xem ngay",
                      onTap: () {
                        Navigator.pushNamed(context, AppRoutes.TrailerRoutes,
                            arguments: {
                              "id": movies.id.toString(),
                              "action": "watch_now",
                              "category": "movie",
                            });
                      }),
                  VerticalIconButton(
                      icon: Icons.info,
                      title: "Trailer",
                      onTap: () {
                        fetchDataVideoTrailer(movies.id.toString(), () {
                          Navigator.pushNamed(context, AppRoutes.TrailerRoutes,
                              arguments: {
                                "video": video.dataVideos,
                                "id": movies.id.toString(),
                                "action": "trailer",
                              });
                        });
                      }),
                  VerticalIconButton(
                      icon: Icons.add_box_sharp,
                      title: "Danh sách",
                      onTap: () => print("Danh sách")),
                ],
              )
            ],
          ),
        );
      });
}
