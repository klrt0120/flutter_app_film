// To parse this JSON data, do
//
//     final detailMovieModel = detailMovieModelFromJson(jsonString);

import 'dart:convert';

DetailMovieModel detailMovieModelFromJson(String str) =>
    DetailMovieModel.fromJson(json.decode(str));

class DetailMovieModel {
  DetailMovieModel({
    this.adult,
    this.backdropPath,
    this.belongsToCollection,
    this.budget,
    this.genres,
    this.homepage,
    this.id,
    this.imdbId,
    this.originalLanguage,
    this.originalTitle,
    this.overview,
    this.popularity,
    this.posterPath,
    this.productionCompanies,
    this.productionCountries,
    this.releaseDate,
    this.revenue,
    this.runtime,
    this.spokenLanguages,
    this.status,
    this.tagline,
    this.title,
    this.video,
    this.voteAverage,
    this.voteCount,
  });

  bool? adult;
  String? backdropPath;
  dynamic? belongsToCollection;
  int? budget;
  List<Genre>? genres;
  String? homepage;
  int? id;
  String? imdbId;
  String? originalLanguage;
  String? originalTitle;
  String? overview;
  double? popularity;
  String? posterPath;
  List<ProductionCompany>? productionCompanies;
  List<ProductionCountry>? productionCountries;
  DateTime? releaseDate;
  int? revenue;
  int? runtime;
  List<SpokenLanguage>? spokenLanguages;
  String? status;
  String? tagline;
  String? title;
  bool? video;
  double? voteAverage;
  int? voteCount;
  factory DetailMovieModel.fromJson(String str) =>
      DetailMovieModel.fromMap(json.decode(str));
  factory DetailMovieModel.fromMap(Map<String, dynamic> json) =>
      DetailMovieModel(
        adult: json["adult"],
        backdropPath: json["backdrop_path"],
        belongsToCollection: json["belongs_to_collection"],
        budget: json["budget"],
        genres: List<Genre>.from(json["genres"].map((x) => Genre.fromMap(x))),
        homepage: json["homepage"],
        id: json["id"],
        imdbId: json["imdb_id"],
        originalLanguage: json["original_language"],
        originalTitle: json["original_title"],
        overview: json["overview"],
        popularity: json["popularity"].toDouble(),
        posterPath: json["poster_path"],
        productionCompanies: List<ProductionCompany>.from(
            json["production_companies"]
                .map((x) => ProductionCompany.fromMap(x))),
        productionCountries: List<ProductionCountry>.from(
            json["production_countries"]
                .map((x) => ProductionCountry.fromMap(x))),
        releaseDate: DateTime.parse(json["release_date"]),
        revenue: json["revenue"],
        runtime: json["runtime"],
        spokenLanguages: List<SpokenLanguage>.from(
            json["spoken_languages"].map((x) => SpokenLanguage.fromMap(x))),
        status: json["status"],
        tagline: json["tagline"],
        title: json["title"],
        video: json["video"],
        voteAverage: json["vote_average"].toDouble(),
        voteCount: json["vote_count"],
      );
  get fullPosterImg {
    if (posterPath != null) {
      return 'https://image.tmdb.org/t/p/w500$posterPath';
    }
    return 'https://i.stack.imgur.com/GNhxO.png';
  }

  get fullBackdropPath {
    if (backdropPath != null) {
      return 'https://image.tmdb.org/t/p/w500$backdropPath';
    }
    return 'https://i.stack.imgur.com/GNhxO.png';
  }

  get releaseYear {
    if (releaseDate != null) {
      return releaseDate.toString().substring(0, 4);
    }
    return "";
  }

  get isadult {
    if (adult == true) {
      return "18+";
    }
    return "18+";
  }

  get ConvertRunTime {
    if (runtime != null) {
      int min = runtime! % 60;
      int hour = (runtime! / 60).floor();
      String hours = hour.toString().length <= 1 ? "0$hour giờ" : "$hour giờ";
      String minute = min.toString().length <= 1 ? "0$min phút" : "$min phút";
      return "$hours : $minute";
    }
  }
}

class Genre {
  Genre({
    this.id,
    this.name,
  });

  int? id;
  String? name;
  factory Genre.fromJson(String str) => Genre.fromMap(json.decode(str));
  factory Genre.fromMap(Map<String, dynamic> json) => Genre(
        id: json["id"],
        name: json["name"],
      );
}

class ProductionCompany {
  ProductionCompany({
    this.id,
    this.logoPath,
    this.name,
    this.originCountry,
  });

  int? id;
  dynamic? logoPath;
  String? name;
  String? originCountry;
  factory ProductionCompany.fromJson(String str) =>
      ProductionCompany.fromMap(json.decode(str));
  factory ProductionCompany.fromMap(Map<String, dynamic> json) =>
      ProductionCompany(
        id: json["id"],
        logoPath: json["logo_path"],
        name: json["name"],
        originCountry: json["origin_country"],
      );
}

class ProductionCountry {
  ProductionCountry({
    this.iso31661,
    this.name,
  });

  String? iso31661;
  String? name;
  factory ProductionCountry.fromJson(String str) =>
      ProductionCountry.fromMap(json.decode(str));
  factory ProductionCountry.fromMap(Map<String, dynamic> json) =>
      ProductionCountry(
        iso31661: json["iso_3166_1"],
        name: json["name"],
      );
}

class SpokenLanguage {
  SpokenLanguage({
    this.englishName,
    this.iso6391,
    this.name,
  });

  String? englishName;
  String? iso6391;
  String? name;
  factory SpokenLanguage.fromJson(String str) =>
      SpokenLanguage.fromMap(json.decode(str));
  factory SpokenLanguage.fromMap(Map<String, dynamic> json) => SpokenLanguage(
        englishName: json["english_name"],
        iso6391: json["iso_639_1"],
        name: json["name"],
      );
}
