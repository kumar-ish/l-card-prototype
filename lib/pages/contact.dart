import 'package:flutter/material.dart';

class ContactPage extends StatefulWidget {
  @override
  _ContactPageState createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF7CED7),
      appBar: AppBar(
        elevation: 0.0,
        centerTitle: true,
        title: Image.asset(
          'assets/images/l-card_logo.png',
          fit: BoxFit.cover,
          width: 160,
        ),
      ),
      body: Column(
//        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//        crossAxisAlignment: CrossAxisAlignment.start,
//        children: <Widget>[
//          Center(
//            child: Text(
//              "GET IN TOUCH",
//              style: TextStyle(
//                  fontFamily: 'Brandon',
//                  fontSize: 26,
//                  fontWeight: FontWeight.bold,
//                  color: Color(0xFFF0008C),
//                  letterSpacing: 4),
//            ),
//          ),
//          Center(
//            child: Text(
//              "For general enquiries or business partnership enquiries please fill out the form below.",
//              textAlign: TextAlign.center,
//              style: TextStyle(
//                  fontFamily: "Brandon",
//                  fontStyle: FontStyle.italic,
//                  color: Color(0xFFF0008C),
//                  fontSize: 18),
//            ),
//          ),
//          Container(
//            child: Column(
//              mainAxisAlignment: MainAxisAlignment.start,
//              crossAxisAlignment: CrossAxisAlignment.start,
//              children: [
//                Text(
//                  "Name *",
//                  textAlign: TextAlign.left,
//                  style: TextStyle(
//                      fontFamily: "Brandon",
//                      color: Color(0xFFF0008C),
//                      fontSize: 12),
//                ),
//                Row(
//                  children: [
//                    Expanded(
//                      child: TextField(
//                          decoration: InputDecoration(
//                        contentPadding: EdgeInsets.all(15.0),
//                        filled: true,
//                        fillColor: Colors.white,
//                        border: OutlineInputBorder(),
//                      )),
//                    ),
//                    Expanded(
//                      child: TextField(
//                          decoration: InputDecoration(
//                        contentPadding: EdgeInsets.all(15.0),
//                        filled: true,
//                        fillColor: Colors.white,
//                        border: OutlineInputBorder(),
//                      )),
//                    ),
//                  ],
//                ),
//                Row(
//                  children: [
//                    Expanded(
//                      child: Text(
//                        "First Name",
//                        style: TextStyle(
//                            fontFamily: "Brandon",
//                            color: Color(0xFFF0008C),
//                            fontSize: 10),
//                      ),
//                    ),
//                    Expanded(
//                      child: Text(
//                        "Last Name",
//                        style: TextStyle(
//                            fontFamily: "Brandon",
//                            color: Color(0xFFF0008C),
//                            fontSize: 10),
//                      ),
//                    )
//                  ],
//                ),
//              ],
//            ),
//          ),
//          Container(
//            child: Column(
//              children: [
//                Text(
//                  "Email Address *",
//                  textAlign: TextAlign.left,
//                  style: TextStyle(
//                      fontFamily: "Brandon",
//                      color: Color(0xFFF0008C),
//                      fontSize: 12),
//                ),
//                Expanded(
//                  child: TextField(
//                      decoration: InputDecoration(
//                        contentPadding: EdgeInsets.all(15.0),
//                        filled: true,
//                        fillColor: Colors.white,
//                        border: OutlineInputBorder(),
//                      )),
//                ),
//                Container(
//                  child: Column(
//                    children: [
//                      Text(
//                        "Subject *",
//                        textAlign: TextAlign.left,
//                        style: TextStyle(
//                            fontFamily: "Brandon",
//                            color: Color(0xFFF0008C),
//                            fontSize: 12),
//                      ),
//                      Expanded(
//                        child: TextField(
//                            decoration: InputDecoration(
//                              contentPadding: EdgeInsets.all(15.0),
//                              filled: true,
//                              fillColor: Colors.white,
//                              border: OutlineInputBorder(),
//                            )),
//                      ),
//                    ],
//                  ),
//
//                ),
//                Container(
//                  child: Column(
//                    children: [
//                      Text(
//                        "Message *",
//                        textAlign: TextAlign.left,
//                        style: TextStyle(
//                            fontFamily: "Brandon",
//                            color: Color(0xFFF0008C),
//                            fontSize: 12),
//                      ),
//                      Expanded(
//                        child: TextField(
////                            keyboardType: TextInputType.multiline,
////                            maxLines: 3,
//                            decoration: InputDecoration(
//                              contentPadding: EdgeInsets.all(15.0),
//                              filled: true,
//                              fillColor: Colors.white,
//                              border: OutlineInputBorder(),
//                            )),
//                      )
//                    ],
//                  ),
//                ),
//              ],
//            ),
//          ),
//        ],
//      ),
      ));
  }
}
