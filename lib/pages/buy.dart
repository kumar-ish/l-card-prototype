import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class LawSoc {
  String shorthand;
  String fullName;
  String link;

  LawSoc(this.shorthand, this.fullName, this.link);
}

List<LawSoc> _lawSocs = [
  LawSoc("UQLS", "University of Queensland Law Society",
      "https://uqlcard.getqpay.com/"),
  LawSoc("QUTLS", "Queensland University of Technology Law Society",
      "https://qutlslcard.getqpay.com/"),
  LawSoc("USQLS", "University of Southern Queensland Law Society",
      "https://usqlsmembership.getqpay.com/"),
  LawSoc("GULS", "Griffith University Law Society",
      "https://guls2016member.getqpay.com/"),
];

class BuyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    int data;
    double _width = MediaQuery.of(context).size.width;

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
        body: Padding(padding: EdgeInsets.fromLTRB(0, 25, 0, 0), child: GridView.builder(
            itemCount: data = _lawSocs.length,
            gridDelegate: new SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: _width / 2,
              childAspectRatio: 0.65,
            ),
            itemBuilder: (context, index) {
              return Padding(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    children: <Widget>[
                      GestureDetector(
                          onTap: () => launch(_lawSocs[index].link),
                          child: Image.asset(
                            'assets/images/' +
                                _lawSocs[index].shorthand +
                                "Logo.png",
                            fit: BoxFit.fitWidth,
                          )),
                      Padding(
                          padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                          child: Text(
                            _lawSocs[index].fullName.toUpperCase(),
                            textDirection: TextDirection.ltr,
                            style: TextStyle(
                              fontFamily: "Brandon",
                              color: Color(0xFFF0008C),
                              fontWeight: FontWeight.bold,
                              letterSpacing: 3,
                            ),
                            textAlign: TextAlign.center,
                          ))
                    ],
                  ));
            }))
    );
  }
}

//        body: Center(
//            child: Column(
//          children: <Widget>[
//            Text("BUY THE L CARD",
//                style: TextStyle(
//                    fontFamily: 'Brandon',
//                    fontSize: 26,
//                    fontWeight: FontWeight.bold,
//                    color: Color(0xFFF0008C),
//                    letterSpacing: 4)),
//            Padding(
//                padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
//                child: GestureDetector(
//                    onTap: () => launch(""),
//                    child: Image.asset(
//                      'assets/images/UQLSLogo.png',
//                      fit: BoxFit.cover,
//                    ))),
//          ],
//        ))
