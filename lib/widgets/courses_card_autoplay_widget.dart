import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:motchill/models/movie_model.dart';
import 'package:motchill/widgets/modal_bottomSheet.dart';
import 'package:provider/provider.dart';

import '../providers/movies_provider.dart';

class CardSwiper extends StatelessWidget {
  const CardSwiper({Key? key, required this.movies, required this.title})
      : super(key: key);
  final List<Movie> movies;
  final String title;

  @override
  Widget build(BuildContext context) {
     final videoProvider = Provider.of<MovieProvide>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 15),
          child: Text(
            "${title}",
            style: TextStyle(
                color: HexColor("#da966e"),
                fontSize: 18,
                fontFamily: "Poppins",
                fontWeight: FontWeight.w700),
          ),
        ),
        CarouselSlider(
          options: CarouselOptions(
            height: MediaQuery.of(context).size.height * 0.4,
            autoPlay: true,
            autoPlayAnimationDuration: Duration(
              milliseconds: 800,
            ),
            enlargeCenterPage: true,
            aspectRatio: 10.0,
          ),
          items: movies.asMap().entries.map((item) {
            int index = item.key ; 
            Movie value = item.value ; 
            return Builder(
              builder: (BuildContext context) {
                return GestureDetector(
                  onTap: () => {
                     bottomsheets(context, movies[index] , videoProvider)   //modal_bottomSheet_widget
                  } ,
                  child: Container(
                    height: MediaQuery.of(context).size.height * 1,
                    margin: EdgeInsets.symmetric(horizontal: 1.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        FadeInImage(
                            placeholder:
                                AssetImage("assets/images/no-image-width.png"),
                            image: NetworkImage(value.fullBackdropPath),
                            fit: BoxFit.contain,
                            width: MediaQuery.of(context).size.width * 1) , 
                        SizedBox(height: 10,) ,
                        Text("${value.title}"),
                      ],
                    ),
                  ),
                );
              },
            );
          }).toList(),
        ),
      ],
    );
  }
}
