import 'package:app_movies/models/models.dart';
import 'package:app_movies/widgets/widgets.dart';
import 'package:flutter/material.dart';

class DetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //GET argumento
    final Movie movie = ModalRoute.of(context)!.settings.arguments as Movie;


    return Scaffold(body: CustomScrollView(
      slivers: [
        _CustomAppBar(movie: movie),
        SliverList(delegate:SliverChildListDelegate([
          _PosterAndTitle(movie:movie),
          _Overview(movie:movie),
          CastingCards()
        ]) )
      ],
    ));
  }
}


class _Overview extends StatelessWidget {

final Movie movie;

  const _Overview({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:EdgeInsets.symmetric(horizontal: 20,vertical: 10),
      child:Text(textAlign: TextAlign.justify,style:Theme.of(context).textTheme.subtitle1,
        movie.overview)
    );
  }
}

class _PosterAndTitle extends StatelessWidget {

  final Movie movie;

  const _PosterAndTitle({super.key, required this.movie});
  
  @override
  Widget build(BuildContext context) {

    final TextTheme textTheme = Theme.of(context).textTheme;
    final size = MediaQuery.of(context).size;

    return Container(

      margin:EdgeInsets.only(top:20),
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        children : [
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child:FadeInImage(height: 150,width: 120,
              placeholder: AssetImage('assets/no-image.jpg'),
              image:NetworkImage(movie.fullPosterImg))
          ),

          SizedBox(width:20),
          Column(children: [

            ConstrainedBox(constraints: BoxConstraints(maxWidth: size.width - 180),
            child:  Text(movie.title,style:textTheme.headline5,overflow: TextOverflow.ellipsis,maxLines: 2)),
            Row(children: [Icon(Icons.star_outline,size:15,color:Colors.grey),SizedBox(width: 5),Text('${movie.voteAverage}',style:textTheme.caption)],)
          ])


        ]
      ),

    );
  }
}

class _CustomAppBar extends StatelessWidget {

  final Movie movie;

  const _CustomAppBar({super.key, required this.movie});
  
  @override
  Widget build(BuildContext context) {
    return  SliverAppBar(
      backgroundColor: Colors.indigo,
      expandedHeight: 200,
      floating: false,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        titlePadding: EdgeInsets.all(0),
        title:Container(
          width: double.infinity,alignment: Alignment.bottomCenter,color:Colors.black12,
          child: Text(movie.title,style:TextStyle(fontSize: 16))
        ),
        background:
        FadeInImage(placeholder: AssetImage('assets/loading.gif'),
         image: NetworkImage(movie.fullBackdropPath),
         fit:BoxFit.cover
         ),
      ),
    );
  }
}