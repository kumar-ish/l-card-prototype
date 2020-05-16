import 'package:flutter/material.dart';
import 'package:startupnamer/entities/store.dart';
import 'package:startupnamer/json.dart';
import 'dart:convert';
import 'package:flip_card/flip_card.dart';

void main() => runApp(App());
const PrimaryColour = const Color(0xFFF7CED7);

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        primaryColor: PrimaryColour,
      ),
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Store> _stores = List<Store>();

  List<Store> fetchStores() {
    var _stores = List<Store>();
    var storesJson = jsonDecode(jsonString)['lifestyle'];
    for (var storeJson in storesJson) {
      _stores.add(Store.fromJson(storeJson));
    }
    return _stores;
  }

  @override
  void initState() {
    _stores = fetchStores();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: PrimaryColour,
      appBar: AppBar(
        title: Image.asset(
          'assets/images/l-card_logo.png',
          fit: BoxFit.cover,
          width: 180,
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: GridView.builder(
        gridDelegate: new SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: _width,
          childAspectRatio: 1.7,
        ),
        itemBuilder: (context, index) {
          return Padding(
              padding: EdgeInsets.all(6.0),
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
                    padding: EdgeInsets.fromLTRB(30, 10, 30, 0),
                    child: Column(

                      children: <Widget>[
                        Text(_stores[index].title.toUpperCase(),
                            style: TextStyle(
                                fontFamily: 'Brandon',
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFFF0008C))),
                        Text(_stores[index].address,
                            style: TextStyle(
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.bold,
                                color: Color(0xFFF0008C)),
                        ),
                        Text(
                          _stores[index].description,
                          style: TextStyle(color: Color(0xFFF0008C)),
                        ),
                        Text(_stores[index].deal),
                        Text(_stores[index].business)
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
