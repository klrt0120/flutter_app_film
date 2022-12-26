import 'dart:convert';

import 'package:motchill/models/movie_model.dart';

TrendingModel trendingModelFromJson(String str) =>
    TrendingModel.fromJson(json.decode(str));

class TrendingModel {
  TrendingModel({
    this.page,
    this.results,
    this.totalPages,
    this.totalResults,
  });

  int? page;
  List<Movie>? results;
  int? totalPages;
  int? totalResults;

  factory TrendingModel.fromJson(String str) =>
      TrendingModel.fromMap(json.decode(str));
  factory TrendingModel.fromMap(Map<String, dynamic> json) => TrendingModel(
        page: json["page"],
        results: List<Movie>.from(json["results"].map((x) => Movie.fromMap(x))),
        totalPages: json["total_pages"],
        totalResults: json["total_results"],
      );
}
