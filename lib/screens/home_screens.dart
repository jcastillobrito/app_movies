import 'package:app_movies/widgets/widgets.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
          const CardSWiper(),
          //Slider de peliculas
          MovieSlider(),
        ])));
  }
}
