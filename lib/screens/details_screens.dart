import 'package:app_movies/widgets/widgets.dart';
import 'package:flutter/material.dart';

class DetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //GET argumento
    final String movie = ModalRoute.of(context)?.settings.arguments.toString() ?? 'no-movie';




    return Scaffold(body: CustomScrollView(
      slivers: [
        _CustomAppBar(),
        SliverList(delegate:SliverChildListDelegate([
          _PosterAndTitle(),
          _Overview(),
          _Overview(),
          _Overview(),
          _Overview(),
          _Overview(),
          _Overview(),
          CastingCards()
        ]) )
      ],
    ));
  }
}


class _Overview extends StatelessWidget {
  const _Overview({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:EdgeInsets.symmetric(horizontal: 20,vertical: 10),
      child:Text(textAlign: TextAlign.justify,style:Theme.of(context).textTheme.subtitle1,
        'Consequat excepteur nisi eu et veniam commodo reprehenderit voluptate. Eu Lorem enim velit dolore consequat qui commodo ipsum Lorem duis labore veniam dolore eu.')
    );
  }
}

class _PosterAndTitle extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final TextTheme textTheme = Theme.of(context).textTheme;

    return Container(

      margin:EdgeInsets.only(top:20),
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children : [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child:FadeInImage(height: 200,
              placeholder: AssetImage('assets/no-image.jpg'),
              image:NetworkImage('https://via.placeholder.com/200x300'))
          ),

          SizedBox(width:20),
          Column(children: [
            Text('movie.title',style:textTheme.headline5,overflow: TextOverflow.ellipsis,maxLines: 2),
            Text('movie.original.title',style:textTheme.headline5,overflow: TextOverflow.ellipsis,maxLines: 2),
          ])


        ]
      ),

    );
  }
}

class _CustomAppBar extends StatelessWidget {


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
          child: Text('movie.title',style:TextStyle(fontSize: 16))
        ),
        background:
        FadeInImage(placeholder: AssetImage('assets/loading.gif'),
         image: NetworkImage('https://via.placeholder.com/300x400'),
         fit:BoxFit.cover
         ),
      ),
    );
  }
}