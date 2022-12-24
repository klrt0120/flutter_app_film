import 'dart:math';
import 'package:flutter/material.dart';
import 'package:motchill/providers/movies_provider.dart';
import 'package:motchill/widgets/content_Header.dart';
import 'package:provider/provider.dart';
import '../widgets/courses_card_autoplay_widget.dart';
import '../widgets/custom_app_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ScrollController? _scrollController;

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
    final moviesProvider = Provider.of<MovieProvide>(context);
    final dataMovie = moviesProvider.onDisplayMovies;
    final Size screenSize = MediaQuery.of(context).size;
    if (dataMovie.isEmpty) {
      return const Scaffold(
        body: Text("Loading..."),
      );
    }
    return Scaffold(
      extendBodyBehindAppBar: true,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.grey,
        onPressed: () => {},
        child: const Icon(Icons.cast),
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
                    featuredContent:
                        dataMovie[random.nextInt(dataMovie.length)]),
                CardSwiper(
                  movies: moviesProvider.onDisplayMovies,
                  title: "Phim mới cập nhập",
                ),
              ],
            ))
          ],
        ),
      ),
    );
  }
}
