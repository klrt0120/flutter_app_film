import 'dart:convert';

import 'package:motchill/models/movie_model.dart';

PopularModal popularModalFromJson(String str) =>
    PopularModal.fromJson(json.decode(str));

class PopularModal {
  PopularModal({
    this.page,
    this.results,
    this.totalPages,
    this.totalResults,
  });

  int? page;
  List<Movie>? results;
  int? totalPages;
  int? totalResults;

  factory PopularModal.fromJson(String str) =>
      PopularModal.fromMap(json.decode(str));

  factory PopularModal.fromMap(Map<String, dynamic> json) => PopularModal(
        page: json["page"],
        results:
            List<Movie>.from(json["results"].map((x) => Movie.fromJson(x))),
        totalPages: json["total_pages"],
        totalResults: json["total_results"],
      );
}
