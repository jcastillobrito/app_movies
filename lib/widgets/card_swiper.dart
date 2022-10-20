import 'package:app_movies/models/models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_card_swipper/flutter_card_swiper.dart';

class CardSWiper extends StatelessWidget {

  final List<Movie> movies;

  const CardSWiper({super.key, required this.movies});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    if( this.movies.length == 0) {
      return Container(
        width: double.infinity,
        height: size.height * 0.5,
        child: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    return SizedBox(
        width: double.infinity,
        height: size.height * 0.5,
        child: Swiper(
            itemCount: movies.length,
            layout: SwiperLayout.STACK,
            itemWidth: size.width * 0.6,
            itemHeight: size.height * 0.4,
            itemBuilder: (_ , int index) {

              final movie = movies[index];
              

              return GestureDetector(
                onTap: () => Navigator.pushNamed(context, 'details',
                    arguments: movie),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child:  FadeInImage(
                      placeholder: AssetImage('assets/no-image.jpg'),
                      image:
                          NetworkImage(movie.fullPosterImg),
                      fit: BoxFit.cover),
                ),
              );
              
            }));
  }
}
