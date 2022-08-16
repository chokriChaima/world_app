import 'package:flutter/material.dart';
import 'package:world_time_project/pages/home.dart' ;
import 'package:world_time_project/pages/choose_location.dart' ;
import 'package:world_time_project/pages/loading.dart' ;

void main() {
  runApp(MaterialApp(
  debugShowCheckedModeBanner: false,

    // routes properties are a map
    //map is defiend by a value and a key
    // you can't use the home property seeing as it conflicts the defined routes specifically the '/' key
    // we use initialRoute

    // this overides the default '/'
    initialRoute: '/',
    routes : {
      // the context describes the current position inside a widget tree
      '/' : (context) => const Loading(),
      '/home': (context) => const Home(),
      '/location' : (context) => const ChooseLocation(),
    }
  ));
}


