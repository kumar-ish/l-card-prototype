import 'package:flutter/material.dart';
import 'package:startupnamer/entities/store.dart';
import 'dart:convert';

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
    var jsonString = '''
      [
        {"title":"Friday's Riverside", 
        "text": "shitty club", 
        "img": "friday.jpg", 
        "address": "yeet 303"},
        {"title":"Bar Pacino", 
        "text": "shitty club #2", 
        "img": "bar_pacino.jpg", 
        "address": "yeet 303"}
      ]
    ''';
    var storesJson = jsonDecode(jsonString);
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
    double _width = MediaQuery
        .of(context)
        .size
        .width;
    double _height = MediaQuery
        .of(context)
        .size
        .height;

    return Scaffold(
      backgroundColor: PrimaryColour,
      appBar: AppBar(
        title: Image.asset('images/l-card_logo.png', fit: BoxFit.cover, width: 200,),
        centerTitle: true,
        elevation: 0,
      ),
      body: GridView.builder(
        gridDelegate: new SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: _width,
            childAspectRatio: 2,
            ),
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.all(7.0),
            child: DecoratedBox(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                image: DecorationImage(
                    image: _stores[index].img.substring(0, 5) == 'http'
                        ? NetworkImage(_stores[index].img): AssetImage("images/" + _stores[index].img),
                    fit: BoxFit.fitWidth,
//                    centerSlice: new Rect.fromLTWH(50.0, 50.0, 0, 90.0)
                )
              ),
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
            )
          );
        },
        itemCount: _stores.length,
      ),
    );
  }
}
//      return DecoratedBox(
//        decoration: BoxDecoration(
//          image: DecorationImage(
//            image: AssetImage("images/friday.jpg"),
//            fit: BoxFit.fitWidth),
//        ),
//        child: Center(
//          child: Text(
//              "FRIDAY'S RIVERSIDE",
//              textDirection: TextDirection.ltr,
//              textAlign: TextAlign.center,
//              style: TextStyle(
//                fontFamily: 'Brandon',
//                fontSize: 30,
//                fontWeight: FontWeight.bold
//              )
//          ),
//        ),
//      );

//  @override
//  Widget build(BuildContext context) {
//    return MaterialApp(
//      title: 'Welcome to Flutter',
//      home: DefaultTabController(
//        length: 3,
//        child: Scaffold(
//        appBar: PreferredSize(
//          preferredSize: tab.preferredSize,
//          child: Card(
//            elevation: 26.0,
//            color: Theme.of(context).primaryColor,
//            child: tab,
//            ),
//          ),
//          body: Padding(
//            padding: const EdgeInsets.all(100.0),
//            child: Center(
//              child: Row(
//                crossAxisAlignment: CrossAxisAlignment.start,
//                children: [
//                  Column(
//                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                    children: [
//                      ClipOval(
//                        child: Image.asset(
//                        'images/me.jpg',
//                        fit: BoxFit.cover,
//                        height: 180.0,
//                        width: 180.0,
//                        ),
//                      ),
//                      Text('Madhav Kumar'),
//                    ],
//                  ),
//                ],
//              )
//            ),
//          ),
//        ),
//      )
//    );
//  }
