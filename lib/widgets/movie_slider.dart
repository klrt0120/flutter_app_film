import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:motchill/providers/movies_provider.dart';
import 'package:motchill/widgets/modal_bottomSheet.dart';
import 'package:provider/provider.dart';

import '../models/movie_model.dart';

class MovieSlider extends StatefulWidget {
  const MovieSlider({Key? key, required this.title, required this.fetch})
      : super(key: key);
  final String title;
  final Future fetch;
  @override
  _MovieSliderState createState() => _MovieSliderState();
}

class _MovieSliderState extends State<MovieSlider> {
  @override
  Widget build(BuildContext context) {
    final moviesProvider = Provider.of<MovieProvide>(context, listen: false);
    final size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      width: size.width,
      height: 280,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Text(
              "${widget.title}",
              style: TextStyle(
                  color: HexColor("#da966e"),
                  fontSize: 18,
                  fontFamily: "Poppins",
                  fontWeight: FontWeight.w700),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Flexible(
              child: FutureBuilder(
            future: widget.fetch,
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return const SizedBox(
                  height: 180.0,
                  child: Center(
                      child: CircularProgressIndicator(color: Colors.redAccent)),
                );
              }
              final List<Movie> movies = snapshot.data!;
              return ListView.builder(
                  itemCount: movies.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (_, int index) {
                    return GestureDetector(
                      onTap: () =>
                          bottomsheets(context, movies[index], moviesProvider),
                      child: Container(
                        child: Column(children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 8, left: 8),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: FadeInImage(
                                  placeholder: AssetImage(
                                      "assets/images/no-image.jpg"),
                                  image: NetworkImage(
                                      movies[index].fullPosterImg500),
                                  fit: BoxFit.contain,
                                  width:
                                      MediaQuery.of(context).size.width * 0.3),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          // Text("${movies[index].title}"),
                        ]),
                      ),
                    );
                  });
            },
          )),
        ],
      ),
    );
  }
}
