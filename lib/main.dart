import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(myApp());
}

class myApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var currentColor = Colors.white;

  void RandomColor() {
    setState(() {
      currentColor = Color(Random().nextInt(0xffffffff));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber[300],
        title: Text(
          "My first mobile app",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: RaisedButton(
        onPressed: ()=>RandomColor(),
        color: currentColor,
        child: Container(
          alignment: Alignment.center,
          color: currentColor,
          child: Text(
            "Hey there",
            style: TextStyle(fontSize: 30.0, fontFamily: "HammersmithOne"),
          ),
        ),
      ),
    );
  }
}

//onPressed: () => RandomColor(),
/*Container(
alignment: Alignment.center,
color: currentColor,
child: RaisedButton(
onPressed: () => RandomColor(),
materialTapTargetSize: ,
child: Text(
"Hey there",
style: TextStyle(fontSize: 30.0),
),
color: currentColor,
))*/