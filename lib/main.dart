import 'dart:math';
import 'package:flutter/material.dart';
import 'package:weather/weather.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

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
  var temp;


  void RandomColor() {
    setState(() {
      currentColor = Color(Random().nextInt(0xffffffff));
    });
  }

  getData() async {
    WeatherFactory wf = WeatherFactory('835a33da81d643d0d537e8c223a674cc', language: Language.UKRAINIAN);
    Weather w = await wf.currentWeatherByCityName('Kharkiv');
    print(w);
    setState(() {
      temp = w.temperature.celsius.round();
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
        onPressed: () => RandomColor(),
        color: currentColor,
        child: Container(
          alignment: Alignment.center,
          color: currentColor,
          child: RaisedButton(
            onPressed: getData,
            child: Text("${temp}C"),
          ),

        ),
      ),

    );

  }
}

