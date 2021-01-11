import 'package:flutter/cupertino.dart';
import 'package:flutter_appmovie_app2/Provider/Movie_provider.dart';
import 'package:provider/provider.dart';

class Repository {
  Future<void> fetchMovie(BuildContext context) async{
    MovieProvider movieProvider =Provider.of(context);
    await movieProvider.fetchMovie();
  }
}