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

  int _popularPage = 0;

  MovieProvider() {
    this.getOnDisplayMovie();
    this.getPopularMovie();
  }


  Future<String> _getJSONData(String endpoint,[int page = 1]) async 
  {
    var url = Uri.https(_baseUrl, endpoint,{'api_key': _apiKey, 'language': _language, 'page': '$page'});
    final response = await http.get(url);
    return response.body;
  }

  getOnDisplayMovie() async 
  {

    final jsonData = await _getJSONData('3/movie/now_playing');
    final nowPlayingResponse =  NowPlayingResponse.fromJson(jsonData);
    onDisplayMovies  = nowPlayingResponse.results;
    notifyListeners();
  }

  getPopularMovie() async 
  {
    _popularPage++;
    final jsonData = await _getJSONData('3/movie/popular',_popularPage);
    final popularResponse =  PopularResponse.fromJson(jsonData);
    popularMovies  = [...popularMovies,...popularResponse.results];
    notifyListeners();
  }
}
