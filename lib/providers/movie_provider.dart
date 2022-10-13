import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../models/models.dart';

class MovieProvider extends ChangeNotifier {
  String _baseUrl = 'api.themoviedb.org';
  String _apiKey = 'f5d2d9ffa069dae89d3b6399f8d9c719';
  String _language = 'es-ES';

  List<Movie> onDisplayMovies = [];
  List<Movie> popularMovies = [];

  MovieProvider() {
    this.getOnDisplayMovie();
    this.getPopularMovie();
  }

  getOnDisplayMovie() async {
    var url = Uri.https(_baseUrl, '3/movie/now_playing',{'api_key': _apiKey, 'language': _language, 'page': '1'});
    final response = await http.get(url);
    final nowPlayingResponse =  NowPlayingResponse.fromJson(response.body);
    onDisplayMovies  = nowPlayingResponse.results;
    notifyListeners();
  }

  getPopularMovie() async {
    var url = Uri.https(_baseUrl, '3/movie/popular',{'api_key': _apiKey, 'language': _language, 'page': '1'});
    final response = await http.get(url);
    final popularResponse =  PopularResponse.fromJson(response.body);
    popularMovies  = [...popularMovies,...popularResponse.results];
    print(popularMovies[0].title);

    notifyListeners();
  }
}
