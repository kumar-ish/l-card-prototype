import 'package:flutter/material.dart';
import 'package:lcardprototype/pages/home.dart';
import 'package:lcardprototype/pages/map.dart';
import 'package:lcardprototype/pages/places.dart';
import 'package:lcardprototype/pages/buy.dart';


void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        primaryColor: Color(0xFFF7CED7),
      ),
      debugShowCheckedModeBanner: false,

      routes:{
        "/": (context) => HomePage(),
        "/places": (context) => PlacesPage(),
        "/map": (context) => MapPage(),
        "/buy": (context) => BuyPage()
      }

    );
  }
}

