import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MovieProvider extends ChangeNotifier {
  String _baseUrl = 'api.themoviedb.org';
  String _apiKey = 'f5d2d9ffa069dae89d3b6399f8d9c719';
  String _language = 'es-ES';

  MovieProvider() {
    print('movie provider inicializado');
    this.getOnDisplayMovie();
  }

  getOnDisplayMovie() async {
    var url = Uri.https(_baseUrl, '3/movie/now_playing',
        {'api_key': _apiKey, 'language': _language, 'page': '1'});
    final response = await http.get(url);
    final Map<String, dynamic> decodeData = json.decode(response.body);
    print(decodeData['dates']);
  }
}