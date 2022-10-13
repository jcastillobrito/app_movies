import 'package:app_movies/models/movie.dart';
import 'package:flutter/material.dart';

class MovieSlider extends StatelessWidget {

  final List<Movie> movies;
  final String?  title;

  const MovieSlider({super.key, required this.movies,this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: 260,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          //Texto
          if(this.title != null)
             Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Text(this.title!,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold))),

          SizedBox(height: 10),
          // Scroll Horizontal
          Expanded(
              child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: movies.length,
                  itemBuilder: (_, int index) =>
                      _MoviePoster(movie: movies[index])))
        ]));
  }
}

class _MoviePoster extends StatelessWidget {

  final Movie movie;

  const _MoviePoster({ required this.movie});
  
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
        child:  FadeInImage(placeholder: AssetImage('assets/no-image.jpg'), image: NetworkImage(movie.fullBackdropPath),width:130,height:190,fit:BoxFit.cover))),

        const SizedBox(height: 5),
        Text(movie.title,maxLines: 2,overflow: TextOverflow.ellipsis,textAlign: TextAlign.center)
        ]));
  }
}
