import 'dart:convert';

import 'package:flutter_appmovie_app2/Provider/Films.dart';
import 'package:http/http.dart' as http;

class FilmsApi {
  Future<Movie> fetchMovie() async {
    var response = await http.get(
        'https://api.themoviedb.org/3/movie/popular?api_key=837aa67b269303622a476bbe24283a57'
    );
      if(response.statusCode ==200){
       var movieResponse= Movie.fromJson(json.decode(response.body));
       return movieResponse;
      }
      return Movie(results: []);
  }
  // void addmovie(Movie movie){
  //   const url="https://flutter-post-b5c40-default-rtdb.firebaseio.com/FilmsApi.json";
  //   http.post(url,body: json.encode({
  //    Movie(results: ['tit])
  //   }));
  // }

}