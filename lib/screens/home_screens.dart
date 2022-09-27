import 'package:app_movies/providers/movie_provider.dart';
import 'package:app_movies/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final moviesProvider = Provider.of<MovieProvider>(context);

    return Scaffold(
        appBar: AppBar(
            actions: [
              IconButton(
                  icon: const Icon(Icons.search_outlined), onPressed: () {})
            ],
            title: const Text('Peliculas en Cines'),
            elevation: 0,
            centerTitle: true),
        body: SingleChildScrollView(
            child: Column(children: [
          //tarjetas principales
           CardSWiper(movies :moviesProvider.onDisplayMovies),
          //Slider de peliculas
          MovieSlider(),
        ])));
  }
}
