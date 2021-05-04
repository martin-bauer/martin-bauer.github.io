import 'package:bama1033pages/services/service_locator.dart';
import 'package:bama1033pages/activities/MainActivity.dart';
import 'package:flutter/material.dart';

void main() {
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Martinez`s Page',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
        scaffoldBackgroundColor: Colors.black,
        fontFamily: 'Ubuntu',
      ),
      home: MyHomePage(title: 'Martin Bauers Page'),
    );
  }
}