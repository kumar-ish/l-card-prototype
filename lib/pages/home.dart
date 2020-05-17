import 'package:flutter/material.dart';
import 'package:lcardprototype/pages/home.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void changePage(String category) {
    Navigator.pushNamed(context, "/places", arguments: {"category": category});
  }

  List<Widget> _createChildren() {
    return List<Widget>.generate(
      categories.length,
      (int index) {
        return new FlatButton(
          child: Text(categories[index].toUpperCase(),
              style: TextStyle(
                  fontFamily: 'Brandon',
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFFF0008C),
                  letterSpacing: 4)),
          onPressed: () {
            changePage(categories[index]);
          },
        );
      },
    );
  }

  List<String> categories = ["retail", "food", "nightlife", "lifestyle"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF7CED7),
      appBar: new AppBar(
        elevation: 0.0,
        title: Image.asset(
          'assets/images/l-card_logo.png',
          fit: BoxFit.cover,
          width: 160,
        ),
        centerTitle: true,
      ),
      body: Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: _createChildren() +
              <Widget>[
                new FlatButton(
                  child: Text("BUY THE L CARD",
                      style: TextStyle(
                          fontFamily: 'Brandon',
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFFF0008C),
                          letterSpacing: 4)),
                  onPressed: () {
                    Navigator.pushNamed(context, "/buy");
                  },
                ),
                new FlatButton(
                  child: Text("MAPS",
                      style: TextStyle(
                          fontFamily: 'Brandon',
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFFF0008C),
                          letterSpacing: 4)),
                  onPressed: () {
                    Navigator.pushNamed(context, "/map");
                  },
                )
              ],
        ),
      ),
    );
  }
}
