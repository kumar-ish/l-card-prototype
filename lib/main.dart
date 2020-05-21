import 'package:flutter/material.dart';
import 'package:lcardprototype/pages/home.dart';
import 'package:lcardprototype/pages/map.dart';
import 'package:lcardprototype/pages/places.dart';
import 'package:lcardprototype/pages/buy.dart';
import 'package:lcardprototype/pages/contact.dart';

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

      onGenerateRoute: (RouteSettings settings) {
        var routes = <String, WidgetBuilder>{
          "/": (context) => HomePage(),
          "/places": (context) => PlacesPage(settings.arguments),
          "/map": (context) => MapPage(),
          "/buy": (context) => BuyPage(),
          "/contact": (context) => ContactPage(),
        };
        WidgetBuilder builder = routes[settings.name];
        return MaterialPageRoute(builder: (context) => builder(context));
      },
    );
  }
}
