import 'dart:math';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:motchill/providers/movies_provider.dart';
import 'package:motchill/screens/profile.dart';
import 'package:motchill/widgets/content_Header.dart';
import 'package:provider/provider.dart';
import '../core/routes/routes.dart';
import '../providers/authenciation_provider.dart';
import '../widgets/courses_card_autoplay_widget.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/movie_slider.dart';
import 'listBookmark.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ScrollController? _scrollController;
  final _supabaseClient = AuthenciationNotifier();
  double _scrollOffset = 0.0;

  void iniState() {
    _scrollController = ScrollController()
      ..addListener(() {
        setState(() {
          _scrollOffset = _scrollController!.offset;
        });
      });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Random random = new Random();
    // import provider
    final moviesProvider = Provider.of<MovieProvide>(context);
    //
    final dataMovie = moviesProvider.onDisplayMovies;
    final Size screenSize = MediaQuery.of(context).size;
    if (dataMovie.isEmpty) {
      return const Scaffold(
        body: Text("Loading..."),
      );
    }
    return Scaffold(
      extendBodyBehindAppBar: true,
      bottomNavigationBar: CurvedNavigationBar(
        height: 70,
        index: 0,
        color: HexColor("#000"),
        backgroundColor: Colors.transparent,
        items: <Widget>[
          Icon(Icons.home, size: 30),
          Icon(Icons.list, size: 30),
          Icon(Icons.manage_accounts, size: 30),
        ],
        onTap: (index) {
          print(index);
          if (index == 0) {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => HomePage()));
          }
          if (index == 1) {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => ListBookmarkScreen()));
          }

          if (index == 2) {
            () async {
              await _supabaseClient.getData();
              Navigator.pushNamed(context, "${AppRoutes.ProfileRoutes}",
                  arguments: {
                    "username": _supabaseClient.user['username'],
                    "email": _supabaseClient.user['email']
                  });
            }();
          }
        },
      ),
      appBar: PreferredSize(
        preferredSize: Size(screenSize.width, 100.0),
        child: CustomAppBar(
          scrollOffset: _scrollOffset,
        ),
      ),
      body: Container(
        color: Colors.black,
        child: CustomScrollView(
          controller: _scrollController,
          slivers: [
            // t???o cu???n
            SliverToBoxAdapter(
                child: Column(
              children: [
                ContentHeader(
                    // content_Header_widget
                    featuredContent:
                        dataMovie[random.nextInt(dataMovie.length)]),
                CardSwiper(
                  // courses_card_autoplay_Widget
                  movies: moviesProvider.onDisplayMovies,
                  title: "Phim m???i c???p nh???p",
                ),
                MovieSlider(
                    title: "Phim theo xu h?????ng",
                    fetch: moviesProvider.getTrendingMovies()),
                MovieSlider(
                    title: "S???p ph??t h??nh",
                    fetch: moviesProvider.getUpcoming()),
                MovieSlider(
                    title: "Phim H??nh ?????ng",
                    fetch: moviesProvider.getGenresFilmMovie("movie", "28")),
                MovieSlider(
                    title: "Phim G??y C???n ",
                    fetch: moviesProvider.getGenresFilmMovie("movie", "53")),
                MovieSlider(
                    title: "Phim Ho???t H??nh",
                    fetch: moviesProvider.getGenresFilmMovie("movie", "16")),
                MovieSlider(
                    title: "Phim Phi??u L??u",
                    fetch: moviesProvider.getGenresFilmMovie("movie", "12")),
                MovieSlider(
                    title: "Phim H??i",
                    fetch: moviesProvider.getGenresFilmMovie("movie", "35")),
                MovieSlider(
                    title: "Phim Gia ????nh",
                    fetch: moviesProvider.getGenresFilmMovie("movie", "10751")),
                MovieSlider(
                    title: "Phim Kinh D???",
                    fetch: moviesProvider.getGenresFilmMovie("movie", "27")),
                MovieSlider(
                    title: "Phim T??nh C???m",
                    fetch: moviesProvider.getGenresFilmMovie("movie", "10749")),
                MovieSlider(
                    title: "Phim Khoa H???c Vi???n T?????ng",
                    fetch: moviesProvider.getGenresFilmMovie("movie", "878")),
              ],
            ))
          ],
        ),
      ),
    );
  }
}
