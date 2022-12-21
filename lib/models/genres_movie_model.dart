import 'dart:convert';

import 'package:motchill/models/movie_model.dart';

GenresMovieModel genresMovieFromJson(String str) =>
    GenresMovieModel.fromJson(json.decode(str));

class GenresMovieModel {
  GenresMovieModel({
    this.page,
    this.results,
    this.totalPages,
    this.totalResults,
  });

  int? page;
  List<Movie>? results;
  int? totalPages;
  int? totalResults;
  factory GenresMovieModel.fromJson(String str) =>
      GenresMovieModel.fromMap(json.decode(str));
  factory GenresMovieModel.fromMap(Map<String, dynamic> json) =>
      GenresMovieModel(
        page: json["page"],
        results: List<Movie>.from(json["results"].map((x) => Movie.fromMap(x))),
        totalPages: json["total_pages"],
        totalResults: json["total_results"],
      );
}
