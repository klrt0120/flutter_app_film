import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:motchill/widgets/buttonBack_widget.dart';
import 'package:provider/provider.dart';

import '../core/routes/routes.dart';
import '../models/movie_model.dart';
import '../providers/authenciation_provider.dart';
import '../providers/movies_provider.dart';
import '../widgets/modal_bottomSheet.dart';
import '../widgets/movie_genres_widget.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final _supabaseClient = AuthenciationNotifier();
  String search = "";
  @override
  Widget build(BuildContext context) {
    final movieProvider = Provider.of<MovieProvide>(context, listen: false);
    // movieProvider.searchMovie(search) ;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: Row(
                  children: [
                    ButtonBack(),
                    Spacer(),
                    SizedBox(
                      width: 10,
                    ),
                    Padding(
                        padding: EdgeInsets.only(right: 20),
                        child: GestureDetector(
                          onTap: () {
                            () async {
                              await _supabaseClient.getData();
                              Navigator.pushNamed(
                                  context, "${AppRoutes.ProfileRoutes}",
                                  arguments: {
                                    "username":
                                        _supabaseClient.user['username'],
                                    "email": _supabaseClient.user['email']
                                  });
                            }();
                          },
                          child: CircleAvatar(
                            child: CircleAvatar(
                                backgroundImage: NetworkImage(
                                    "https://picsum.photos/seed/picsum/200/300")),
                          ),
                        ))
                  ],
                ),
              ),
              SizedBox(
                height: 0,
              ),
              TextField(
                onChanged: (value) {
                  print(value.runtimeType);
                  setState(() {
                    search = value;
                  });
                },
                style: TextStyle(
                  color: Colors.black,
                ),
                decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide.none),
                    hintText: "Tìm kiếm phim, thể loại phim...",
                    hintStyle: TextStyle(fontSize: 18.0, color: Colors.black),
                    prefixIcon: Icon(Icons.search, color: Colors.black),
                    prefixIconColor: Colors.redAccent),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                "Từ khóa tìm kiếm ${search}",
                style: TextStyle(fontSize: 15),
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                child: search != ""
                    ? FutureBuilder(
                        future: movieProvider.searchMovie(search),
                        builder: (_, AsyncSnapshot<List<Movie>> snapshot) {
                          if (!snapshot.hasData) {
                            return const SizedBox(
                              height: 180.0,
                              child: Center(
                                  child: CircularProgressIndicator(
                                      color: Colors.redAccent)),
                            );
                          }

                          final List<Movie> movies = snapshot.data!;
                          print("snapshot.data -------- ${snapshot.data}");
                          return Expanded(
                              child: Container(
                                  height: 500,
                                  child: CustomScrollView(
                                    primary: false,
                                    slivers: <Widget>[
                                      SliverPadding(
                                        padding: const EdgeInsets.all(20),
                                        sliver: SliverGrid.count(
                                          crossAxisSpacing: 10,
                                          mainAxisSpacing: 10,
                                          crossAxisCount: 3,
                                          childAspectRatio: 1 / 1.5,
                                          children: <Widget>[
                                            ...movies.map((e) {
                                              return GestureDetector(
                                                onTap: () {
                                                  bottomsheets(context, e,
                                                      movieProvider);
                                                },
                                                child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  child: FadeInImage(
                                                      placeholder: AssetImage(
                                                          "assets/images/no-image.jpg"),
                                                      image: NetworkImage(
                                                          e.fullPosterImg500),
                                                      fit: BoxFit.contain,
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width *
                                                              0.3),
                                                ),
                                                // child: Container(
                                                //   decoration: BoxDecoration(
                                                //       borderRadius:
                                                //           BorderRadius.all(
                                                //               Radius.circular(
                                                //                   10)),
                                                //       image: DecorationImage(
                                                //           image: NetworkImage(
                                                //               "${e.fullPosterImg500}"))),
                                                //   // child: Image(image: NetworkImage(e.fullPosterImg500))
                                                // ),
                                              );
                                            }).toList()
                                          ],
                                        ),
                                      ),
                                    ],
                                  )));
                        })
                    : Container(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
