import 'package:flutter/material.dart';


class FilmsDetail extends StatelessWidget{
  final String title;
  final String poster;
  final String overview;
  final double voteAverage;
  final double popularity;

  FilmsDetail(this.title,this.poster,this.overview, this.voteAverage, this.popularity, );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black45,
      body: SingleChildScrollView(
        child: Container(
            padding: EdgeInsets.only(left: 2),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  //color: Colors.white,
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height*0.4,
                  child: Card(
                    color:Theme.of(context).primaryColor ,
                    child: Padding(
                      padding: EdgeInsets.all(2),
                      child: Image.network(
                        "http://image.tmdb.org/t/p/w500${poster}",
                        fit: BoxFit.fill
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 6,),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.red, width: 2),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                         padding: EdgeInsets.only(left: 8,),
                          width: MediaQuery.of(context).size.width*0.7,
                            child: Wrap(
                                children :<Widget>[
                                  Text(title
                                    ,style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 19,),
                                    softWrap: true,
                                  )
                                ]
                            ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 8,top: 8,bottom: 8),
                          child: Column(
                            children: <Widget>[
                              Stack(
                                  alignment: Alignment.center,
                                  children :<Widget>[
                                Icon(Icons.star,size: 65,color: Colors.orange,),
                                Text('${voteAverage}',style: TextStyle(color: Colors.black,fontSize: 17),),
                              ]
                              ),
                              Text('${popularity}',style: TextStyle(color: Colors.white,fontSize: 18),),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 10,),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Container(
                    width: double.infinity,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.red,width: 2),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(14.0),
                        child: Text(overview,
                          style: TextStyle(color: Colors.white,fontSize: 18),
                        ),
                      )
                  ),
                ),



              ],
            ),
          ),
      ),
    );

  }

}