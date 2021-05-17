import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          //SizedBox(height: 1,),
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey[700]),
            ),
            child: TextField(
              cursorColor: Colors.grey[800],
              decoration: InputDecoration(
                border: InputBorder.none,
                hintStyle: TextStyle(
                  color: Color.fromRGBO(244, 47, 66, 1)
                ),
                hintText: "Search for video",
                prefixIcon: Icon(Icons.search, color: Color.fromRGBO(244, 47, 66, 1),),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

