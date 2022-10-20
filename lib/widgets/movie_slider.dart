import 'package:app_movies/models/movie.dart';
import 'package:flutter/material.dart';

class MovieSlider extends StatefulWidget {

  final List<Movie> movies;
  final String?  title;

  final Function onNextPage;


  const MovieSlider({super.key, required this.movies,this.title,required this.onNextPage});

  @override
  State<MovieSlider> createState() => _MovieSliderState();
}

class _MovieSliderState extends State<MovieSlider> {

  final ScrollController scrollController = new ScrollController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    scrollController.addListener(() 
    {
      if (scrollController.position.pixels >= scrollController.position.maxScrollExtent - 500)
      {
        widget.onNextPage();
      }
      //print(scrollController.position.pixels);
      //print(scrollController.position.maxScrollExtent);
      
      
     });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: 260,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          //Texto
          if(this.widget.title != null)
             Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Text(this.widget.title!,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold))),

          SizedBox(height: 10),
          // Scroll Horizontal
          Expanded(
              child: ListView.builder(
                  controller: scrollController,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: widget.movies.length,
                  itemBuilder: (_, int index) =>
                      _MoviePoster(movie: widget.movies[index])))
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
        GestureDetector(onTap:()=>Navigator.pushNamed(context, 'details',arguments:movie),
          //borderRadius
        child:ClipRRect(borderRadius: BorderRadius.circular(20),
        //fadeImage
        child:  FadeInImage(placeholder: AssetImage('assets/no-image.jpg'), image: NetworkImage(movie.fullBackdropPath),width:130,height:190,fit:BoxFit.cover))),

        const SizedBox(height: 5),
        Text(movie.title,maxLines: 2,overflow: TextOverflow.ellipsis,textAlign: TextAlign.center)
        ]));
  }
}
