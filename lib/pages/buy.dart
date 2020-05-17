import 'package:flutter/material.dart';

class BuyPage extends StatelessWidget {
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
        body: Column(
          children: <Widget>[
            Text("BUY THE L CARD"),
          ],
        ));
  }
}
