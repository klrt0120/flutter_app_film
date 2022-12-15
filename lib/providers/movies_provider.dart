import 'dart:async';

import 'package:flutter/material.dart';
import 'package:motchill/models/movie_model.dart';
import 'package:motchill/models/now_playing_model.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

import '../models/get_video_model.dart';
import '../models/video_model.dart';

class MovieProvide extends ChangeNotifier {
  final String _apiKey = 'd8f8edbbdc27ab9a16942772f29aa16c';
  final String _baseUrl = 'api.themoviedb.org';
  final String _language = 'vi';

  List<Movie> onDisplayMovies = [];
  List<Movie> onDisplayTvShows = [];
  List<Video> dataVideos = [];

  Future<String> _getJsonData(String category, String endPoint,
      [int page = 1]) async {
    final url = Uri.https(_baseUrl, '3/${category}/${endPoint}', {
      'api_key': _apiKey,
      'language': _language,
      'page': '$page',
    });

    final response = await http.get(url);
    return response.body;
  }

  Future<String> _getJsonData_Discover(String category, [int page = 1]) async {
    final url = Uri.https(_baseUrl, '3/discover/${category}', {
      'api_key': _apiKey,
      'language': _language,
      'page': '$page',
    });

    final response = await http.get(url);
    return response.body;
  }

  getOnDiaplayMovies() async {
    final jsonData = await _getJsonData('movie', 'now_playing');
    final nowPlayingResponse = NowPlayingResponse.fromJson(jsonData);
    onDisplayMovies = nowPlayingResponse.results!;
    notifyListeners();
  }

  Future<String> _getJsonData_Video(String category, String id,
      [int page = 1]) async {
    final url = Uri.https(_baseUrl, '3/${category}/${id}/videos', {
      'api_key': _apiKey,
      'language': "en",
      'page': '$page',
    });
 
    final response = await http.get(url);
    return response.body;
  }

  getVideo(String category, String? id) async {
    final jsonData = await _getJsonData_Video(category, id.toString());
    final getvideoData = GetVideoModel.fromJson(jsonData);
    dataVideos = getvideoData.results!;
    print(dataVideos[0].key) ;
    notifyListeners();
  }

  MovieProvide() {
    getOnDiaplayMovies();
  }
}
