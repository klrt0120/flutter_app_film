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
            // tạo cuộn
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
                  title: "Phim mới cập nhập",
                ),
                MovieSlider(
                    title: "Phim theo xu hướng",
                    fetch: moviesProvider.getTrendingMovies()),
                MovieSlider(
                    title: "Sắp phát hành",
                    fetch: moviesProvider.getUpcoming()),
                MovieSlider(
                    title: "Phim Hành Động",
                    fetch: moviesProvider.getGenresFilmMovie("movie", "28")),
                MovieSlider(
                    title: "Phim Gây Cấn ",
                    fetch: moviesProvider.getGenresFilmMovie("movie", "53")),
                MovieSlider(
                    title: "Phim Hoạt Hình",
                    fetch: moviesProvider.getGenresFilmMovie("movie", "16")),
                MovieSlider(
                    title: "Phim Phiêu Lưu",
                    fetch: moviesProvider.getGenresFilmMovie("movie", "12")),
                MovieSlider(
                    title: "Phim Hài",
                    fetch: moviesProvider.getGenresFilmMovie("movie", "35")),
                MovieSlider(
                    title: "Phim Gia Đình",
                    fetch: moviesProvider.getGenresFilmMovie("movie", "10751")),
                MovieSlider(
                    title: "Phim Kinh Dị",
                    fetch: moviesProvider.getGenresFilmMovie("movie", "27")),
                MovieSlider(
                    title: "Phim Tình Cảm",
                    fetch: moviesProvider.getGenresFilmMovie("movie", "10749")),
                MovieSlider(
                    title: "Phim Khoa Học Viễn Tưởng",
                    fetch: moviesProvider.getGenresFilmMovie("movie", "878")),
              ],
            ))
          ],
        ),
      ),
    );
  }
}
