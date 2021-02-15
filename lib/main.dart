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
  var temp;
  var flt;
  String weather;
  var weatherIcon;

  getData() async {
    WeatherFactory wf = WeatherFactory('835a33da81d643d0d537e8c223a674cc',
        language: Language.UKRAINIAN);
    Weather w = await wf.currentWeatherByCityName('Kharkiv');
    print(w.weatherDescription);
    setState(() {
      temp = w.temperature.celsius.round();
      flt = w.tempFeelsLike.celsius.round();
      weather = w.weatherDescription;
      //weatherIcon = w.weatherIcon as IconData;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber[300],
        title: Text(
          "Weather application",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: Container(
        color: Colors.white,
        alignment: Alignment.topCenter,
        child: Card(
            child: InkWell(
              onTap: (){
               getData();
              },
              child: Container(
               width: 200,
               height: 300,
               child: Container(
                   child: Column(
                     mainAxisAlignment: MainAxisAlignment.center,
                     crossAxisAlignment: CrossAxisAlignment.stretch,
                     children: [
                       Text('Температура повітря зараз: $temp'),
                       Text('Відчувається як: $flt'),
                       Text ('$weather')
                     ],
                   )
               )
               ),

        )),
      ),
    );
  }
}
