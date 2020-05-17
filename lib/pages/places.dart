import 'package:flutter/material.dart';
import 'package:lcardprototype/entities/store.dart';
import 'package:lcardprototype/json.dart';
import 'dart:convert';
import 'package:flip_card/flip_card.dart';
import 'package:url_launcher/url_launcher.dart';

class PlacesPage extends StatefulWidget {
  @override
  _PlacesPageState createState() => _PlacesPageState();
}

class _PlacesPageState extends State<PlacesPage> {

  final PrimaryColour = const Color(0xFFF7CED7);

  List<Store> _stores = List<Store>();

  List<Store> fetchStores(String category) {
    var _stores = List<Store>();
    var storesJson = jsonDecode(jsonString)[category];
    for (var storeJson in storesJson) {
      _stores.add(Store.fromJson(storeJson));
    }
    return _stores;
  }

  @override
  void initState() {
//    Map data = ModalRoute.of(context).settings.arguments;
//    String category = data["category"];
//    _stores = fetchStores(category);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Map data = ModalRoute.of(context).settings.arguments;
    String category = data["category"];
    _stores = fetchStores(category);

    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: PrimaryColour,
      appBar: AppBar(
        title: Image.asset(
          'assets/images/l-card_logo.png',
          fit: BoxFit.cover,
          width: 160,
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: GridView.builder(
        gridDelegate: new SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: _width / 3,
          childAspectRatio: 1.5,
        ),
        itemBuilder: (context, index) {
          return Padding(
              padding: EdgeInsets.fromLTRB(6.0, 4.0, 6.0, 4.0),
              child: FlipCard(
                direction: FlipDirection.VERTICAL, // default
                front: Container(
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        image: DecorationImage(
                          image: NetworkImage(_stores[index].img),
                          fit: BoxFit.fitWidth,
                        )),
                    child: Center(
                      child: Text(_stores[index].title.toUpperCase(),
                          textDirection: TextDirection.ltr,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontFamily: 'Brandon',
                              fontSize: 26,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              letterSpacing: 4)),
                    ),
                  ),
                ),
                back: Container(
                  //this.address, this.description, this.deal, this.business
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      color: Color(0xFFF6F2F2)),
                  child: Center(
                      child: Padding(
                    padding: EdgeInsets.fromLTRB(20, 12, 20, 0),
                    child: Column(
                      children: [
                        Text(_stores[index].title.toUpperCase(),
                            style: TextStyle(
                                fontFamily: 'Brandon',
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFFF0008C))),
                        Text(
                          _stores[index].address,
                          style: TextStyle(
                              fontFamily: 'Brandon',
                              fontWeight: FontWeight.bold,
                              color: Color(0xFFF0008C), fontSize: 11),
                        ),
                        Text(
                          _stores[index].description,
                          style: TextStyle(
                              fontFamily: "Brandon", color: Color(0xFFF0008C), fontSize: 11),
                        ),
                        Text(_stores[index].deal,
                            style: TextStyle(
                                fontFamily: "Brandon",
                                color: Color(0xFFF0008C), fontSize: 10)),
                        new InkWell(
                            child: Padding(
                                padding:
                                    EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Color(0xFFF7CDE7),
                                      ),
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(20)),
                                      color: Color(0xFFF7CDE7)),
                                  child: Padding(
                                      padding: EdgeInsets.fromLTRB(
                                          20.0, 6.0, 20.0, 6.0),
                                      child: Text(
                                        "GO TO BUSINESS",
                                        style: TextStyle(fontFamily: "Brandon"),
                                      )),
                                )),
                            onTap: () => launch(_stores[index].business)),
                      ],
                    ),
                  )),
                ),
              ));
        },
        itemCount: _stores.length,
      ),
    );
  }
}
