import 'package:flutter/material.dart';
import 'package:motchill/core/routes/routes.dart';
import 'package:motchill/widgets/appbarButton_widget.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({Key? key, this.scrollOffset = 0.0}) : super(key: key);
  final double scrollOffset;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 10.0),
      color:
          Colors.black.withOpacity((scrollOffset / 350).clamp(0, 1).toDouble()),
      child: SafeArea(
          child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                "assets/images/motchill.png",
                width: MediaQuery.of(context).size.width * 0.3,
              ),
              const SizedBox(
                width: 12,
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    /* AppBarButton(title: "Movie", onTap: () => print("movie")),
                  AppBarButton(
                      title: "TV Shows", onTap: () => print("tv shows")),*/
                    Spacer(),
                    GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, AppRoutes.SearchRoutes,
                              arguments: "a");
                        },
                        child: Icon(Icons.search_sharp)),
                    SizedBox(
                      width: 10,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushReplacementNamed(
                            context, "${AppRoutes.ProfileRoutes}");
                      },
                      child: CircleAvatar(
                        child: CircleAvatar(
                            backgroundImage: NetworkImage(
                                "https://picsum.photos/seed/picsum/200/300")),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              AppBarButton(title: "Phim T.hình", onTap: () {}),
              AppBarButton(title: "Phim", onTap: () {}),
              AppBarButton(title: "Phân Loại", onTap: () {})
            ],
          )
        ],
      )),
    );
  }
}
