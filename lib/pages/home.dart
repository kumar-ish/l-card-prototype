import 'package:flutter/material.dart';
import 'package:lcardprototype/pages/home.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  void changePage(String category){
    Navigator.pushNamed(context, "/places", arguments: {"category": category});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(),
      body: new Column(
        children: <Widget>[
          new FlatButton(
            child: Text("retail"),
            onPressed:  () {
              changePage("retail");
            },
          ),
          new FlatButton(
            child: Text("food"),
            onPressed: () {
              changePage("food");
            },
          ),
          new FlatButton(
            child: Text("nightlife"),
            onPressed: () {
              changePage("nightlife");
            },
          ),
          new FlatButton(
            child: Text("lifestyle"),
            onPressed: () {
              changePage("lifestyle");
            },
          ),
          new FlatButton(
            child: Text("maps"),
            onPressed: () {
              Navigator.pushNamed(context, "/map");
            },
          ),
        ],
      ),
    );
  }
}
