import 'package:flutter/foundation.dart';
import 'package:flutter_appmovie_app2/Provider/Films.dart';
import 'package:flutter_appmovie_app2/Provider/FilmsApi.dart';

class MovieProvider with ChangeNotifier{
  Movie _movie = Movie(results: []);
  FilmsApi _filmsApi = FilmsApi();

  Movie get movie => _movie;

  set movie(Movie movie) {
    _movie = movie;
    notifyListeners();
  }
  Future<void> fetchMovie() async{
    movie = await _filmsApi.fetchMovie();
    notifyListeners();
 }


}