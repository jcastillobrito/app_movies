import 'package:flutter/material.dart';

class MovieSlider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: 260,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          //Texto
          const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Text('Populares',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold))),
          SizedBox(height: 10),
          // Scroll Horizontal
          Expanded(
              child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: 30,
                  itemBuilder: (BuildContext context, int index) =>
                      _MoviePoster()))
        ]));
  }
}

class _MoviePoster extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: 130,
        height: 190,
        margin: const EdgeInsets.symmetric(horizontal: 10),
        child:Column(children:  [
        GestureDetector(onTap:()=>Navigator.pushNamed(context, 'details',arguments:'arguments-test'),
          //borderRadius
        child:ClipRRect(borderRadius: BorderRadius.circular(20),
        //fadeImage
        child: const FadeInImage(placeholder: AssetImage('assets/no-image.jpg'), image: NetworkImage('https://via.placeholder.com/300x400'),width:130,height:190,fit:BoxFit.cover))),

        const SizedBox(height: 5),
        const Text('StarWars : El retorno del nuevo Jedi por juan carlos castillo',maxLines: 2,overflow: TextOverflow.ellipsis,textAlign: TextAlign.center)
        ]));
  }
}
