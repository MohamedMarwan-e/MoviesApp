import 'package:flutter/material.dart';
import 'package:flutter_appmovie_app2/Provider/Films.dart';
import 'package:flutter_appmovie_app2/Provider/FilmsApi.dart';
import 'package:flutter_appmovie_app2/Provider/Movie_provider.dart';
import 'package:flutter_appmovie_app2/Screens/films_detail.dart';

import 'package:provider/provider.dart';

import 'Screens/Home_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider.value(
            value: MovieProvider(),),
          ChangeNotifierProvider.value(
            value: Result(),),
          ChangeNotifierProvider.value(
            value: Result(),),
        ],
        child: MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'MyShop',
            theme: ThemeData(
              primarySwatch: Colors.red,
              accentColor: Colors.deepOrange,
              fontFamily: 'Lato',
            ),
            home: MyHomePage(),
            // routes: {
            //    FilmsDetail.routeName: (ctx) => FilmsDetail(),
            // }
      )
    );
  }
}


