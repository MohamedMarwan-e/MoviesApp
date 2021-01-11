import 'package:flutter/material.dart';
import 'package:flutter_appmovie_app2/Provider/Movie_provider.dart';
import 'package:flutter_appmovie_app2/services/repository.dart';
import 'package:flutter_appmovie_app2/widgets/movie_screen.dart';

import 'package:provider/provider.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Repository repository =Repository();
  var _isInit=true;
  var futuremovies;

  @override
  void didChangeDependencies() {
    if(_isInit){
       futuremovies =  repository.fetchMovie(context);
    }
    _isInit=false;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(),
      body: Container(
          height: MediaQuery.of(context).size.height,
          child : Consumer<MovieProvider>(
            builder: (context,MovieProvider movieProvider,child){
              if(movieProvider.movie.results.isEmpty){
                return Center(child:CircularProgressIndicator());
              }return MovieScreen();
              },
          )
      ),
    );
  }
}

