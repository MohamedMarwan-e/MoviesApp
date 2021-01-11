import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_appmovie_app2/Provider/Films.dart';
import 'package:flutter_appmovie_app2/Provider/Movie_provider.dart';
import 'package:flutter_appmovie_app2/Screens/films_detail.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

class MovieScreen extends StatefulWidget {
  @override
  _MovieScreenState createState() => _MovieScreenState();
}

class _MovieScreenState extends State<MovieScreen> {
  @override
  Widget build(BuildContext context) {
    final fdata = Provider.of<MovieProvider>(context);
    final res = Provider.of<Result>(context);
    const url =
        "https://flutter-movie-1aa1d-default-rtdb.firebaseio.com/movie_screen.json";
    return GridView.builder(
        itemCount: fdata.movie.results.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.61,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemBuilder: (BuildContext context, index) => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  height: MediaQuery.of(context).size.height * 0.34,
                  child: Card(
                    elevation: 10,
                    color: Colors.red,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: GridTile(
                        child: GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => FilmsDetail(
                                      fdata.movie.results[index].title,
                                      fdata.movie.results[index].posterPath,
                                      fdata.movie.results[index].overview,
                                      fdata.movie.results[index].voteAverage,
                                      fdata.movie.results[index].popularity,
                                    )));
                          },
                          child: Padding(
                            padding: EdgeInsets.all(2),
                            child: Stack(
                                alignment: Alignment.topRight,
                                children: <Widget>[
                                  Image.network(
                                    "http://image.tmdb.org/t/p/w500${fdata.movie.results[index].posterPath}",
                                    fit: BoxFit.fitWidth,
                                    width: double.infinity,
                                  ),
                                  Consumer<Result>(
                                    builder: (context, res, _) => IconButton(
                                        icon: Icon(
                                          fdata.movie.results[index].isFavorited
                                              ? Icons.favorite
                                              : Icons.favorite_border,
                                          size: 30,
                                        ),
                                        color: Colors.red,
                                        onPressed: () {
                                          setState(() {
                                            fdata.movie.results[index].isFavorited = !fdata.movie.results[index].isFavorited;
                                          });
                                          // http.post(url,
                                          //     body: json.encode({
                                          //       'isFavorited': fdata.movie.results[index].isFavorited,
                                          //       'title': fdata.movie.results[index].title,
                                          //       'posterPath': fdata.movie.results[index].posterPath,
                                          //       'overview': fdata.movie.results[index].overview,
                                          //     }));
                                        }),
                                  )
                                ]),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                        padding: EdgeInsets.only(left: 8),
                        height: 20,
                        width: MediaQuery.of(context).size.width * 0.30,
                        child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: <Widget>[
                              Text(
                                fdata.movie.results[index].title,
                                style: TextStyle(color: Colors.white),
                              ),
                            ]
                        )
                    ),
                    Container(
                      height: 20,
                      width: MediaQuery.of(context).size.width * 0.15,
                      child: Text(
                        "${fdata.movie.results[index].voteAverage}/10",
                        style: TextStyle(color: Colors.white),
                      ),
                    )
                  ],
                ),
              ],
            )
    );
  }
}
