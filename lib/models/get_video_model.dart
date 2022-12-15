import 'dart:convert';

import 'package:motchill/models/video_model.dart';

class GetVideoModel {
  GetVideoModel({
    this.id,
    this.results,
  });

  int? id;
  List<Video>? results;

  factory GetVideoModel.fromJson(String str) =>
      GetVideoModel.fromMap(json.decode(str));

  factory GetVideoModel.fromMap(Map<String, dynamic> json) => GetVideoModel(
        id: json["id"],
        results:
            List<Video>.from(json["results"].map((x) => Video.fromMap(x))),
      );
}
