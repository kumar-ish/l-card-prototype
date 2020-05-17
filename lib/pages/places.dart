import 'package:flutter/material.dart';
import 'package:lcardprototype/entities/store.dart';
import 'package:lcardprototype/json.dart';
import 'dart:convert';
import 'package:flip_card/flip_card.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:async';

class PlacesPage extends StatefulWidget {
  @override
  _PlacesPageState createState() => _PlacesPageState();
}

class Debouncer {
  final int milliseconds;
  VoidCallback action;
  Timer _timer;

  Debouncer({this.milliseconds});

  run(VoidCallback action) {
    if (null != _timer) {
      _timer.cancel();
    }
    _timer = Timer(Duration(milliseconds: milliseconds), action);
  }
}

class _PlacesPageState extends State<PlacesPage> {
  final addressStyle = TextStyle(
      fontFamily: 'Brandon',
      fontWeight: FontWeight.bold,
      color: Color(0xFFF0008C),
      fontSize: 11);
  final dealStyle =
      TextStyle(fontFamily: "Brandon", color: Color(0xFFF0008C), fontSize: 10);

  final PrimaryColour = const Color(0xFFF7CED7);
  final _debouncer = Debouncer(milliseconds: 500);
  List<Store> _stores = List<Store>();
  List<Store> _filteredStores = List<Store>();

  List<Store> fetchStores(String category) {
    var _stores = List<Store>();
    var storesJson = jsonDecode(jsonString)[category];
    for (var storeJson in storesJson) {
      _stores.add(Store.fromJson(storeJson));
    }
    return _stores;
  }

  List<Widget> _createPlaceDetailsChildren(store, style, info) {
    return List<Widget>.generate(
      info == "address" ? store.address.length : store.deal.length,
      (int index) {
        return Text(
          info == "address" ? store.address[index] : store.deal[index],
          style: style,
        );
      },
    );
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
    _filteredStores = fetchStores(category);
    int count;
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
        body: Column(
          children: <Widget>[
            TextField(
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(15.0),
                hintText: 'Filter by store name or description',
              ),
              onChanged: (string) {
                _debouncer.run(() {
                  setState(() {
                    _filteredStores = _stores
                        .where((u) => (u.title
                            .toLowerCase()
                            .contains(string.toLowerCase())))
                        .toList();
                  });
                });
              },
            ),
            Expanded(
                child: Container(
                    child: GridView.builder(
              itemCount: count = _filteredStores.length,
              gridDelegate: new SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: _width,
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
                                image: NetworkImage(_filteredStores[index].img),
                                fit: BoxFit.fitWidth,
                              )),
                          child: Center(
                            child: Text(
                                _filteredStores[index].title.toUpperCase(),
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
                            children: <Widget>[
                                  Text(
                                      _filteredStores[index]
                                          .title
                                          .toUpperCase(),
                                      style: TextStyle(
                                          fontFamily: 'Brandon',
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                          color: Color(0xFFF0008C))),
                                ] +
                                _createPlaceDetailsChildren(
                                    _filteredStores[index],
                                    addressStyle,
                                    "address") +
                                [
                                  Text(
                                    _filteredStores[index].description != null
                                        ? _filteredStores[index].description
                                        : " ",
                                    style: TextStyle(
                                        fontFamily: "Brandon",
                                        color: Color(0xFFF0008C),
                                        fontSize: 11),
                                  ),
                                ] +
                                _createPlaceDetailsChildren(
                                    _filteredStores[index], dealStyle, "deal") +
                                [
                                  new InkWell(
                                      child: Padding(
                                          padding: EdgeInsets.fromLTRB(
                                              0.0, 10.0, 0.0, 0.0),
                                          child: Container(
                                            decoration: BoxDecoration(
                                                border: Border.all(
                                                  color: Color(0xFFF7CDE7),
                                                ),
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(20)),
                                                color: Color(0xFFF7CDE7)),
                                            child: Padding(
                                                padding: EdgeInsets.fromLTRB(
                                                    20.0, 6.0, 20.0, 6.0),
                                                child: Text(
                                                  "GO TO BUSINESS",
                                                  style: TextStyle(
                                                      fontFamily: "Brandon"),
                                                )),
                                          )),
                                      onTap: () => launch(
                                          _filteredStores[index].business)),
                                ],
                          ),
                        )),
                      ),
                    ));
              },
            )))
          ],
        ));
  }
}
