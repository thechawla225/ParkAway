import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:sudoku_solver/Timeduration.dart';
import 'dart:async';
import 'dart:convert';
import 'Timeduration.dart';

import 'package:sudoku_solver/map.dart';
import 'map.dart';
import 'package:geolocator/geolocator.dart';
import 'maps.dart';
void main() {
  print("Hello");
  runApp(MaterialApp(
    home: HomePage(),
  ));
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  Map data;
  List userData;


  Future getData() async {
    print("request");
    http.Response response = await http.get("http://parkaway.herokuapp.com/");
    print("Starting");
    data = json.decode(response.body);
    setState(() {
    });
  }

  @override
  void initState() {
    print("request");
    super.initState();
    getData();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
      ),
      drawer: Drawer(child:
    Column(
    children: <Widget>[
      SizedBox(height: 30,),
      MaterialButton(
        child: Text("Open map"),
        onPressed: ()
        {

          Navigator.push( context , MaterialPageRoute(builder: (context) => Map()));

        },

      ),
      MaterialButton(
        child: Text("Time Duration"),
        onPressed: ()
        {

          Navigator.push( context , MaterialPageRoute(builder: (context) => TimeScreen()));

        },

      ),
    ]
    )
      ),
      body: ListView.builder(
        itemCount: userData == null ? 0 : userData.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text("${userData[0]["message"]}",
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.w700,
                      ),),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
