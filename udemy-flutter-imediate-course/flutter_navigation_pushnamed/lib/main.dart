import 'package:flutter/material.dart';

import 'screens/home.dart';
import 'screens/second.dart';
import 'screens/third.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Navigation',
      routes: <String, WidgetBuilder> {
        // all available pages
        '/Home': (BuildContext context) => Home(),
        '/Second': (BuildContext context) => Second(),
        '/Third': (BuildContext context) => Third(),
      },
      home: Home(), // this is the fist page is displayed
    );
  }
}
