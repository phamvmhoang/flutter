import 'package:flutter/material.dart';

import 'my_widget.dart';
import 'clock.dart';
import 'time_counter.dart';
import 'login.dart';

void main() {
  runApp(new MaterialApp(
    home: new MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  _State createState() => new _State();
}

class _State extends State<MyApp> {

  bool _isAuthenticated;
  String _username;

  void onAuthenticate(bool value){
    setState(() {
      _isAuthenticated = value;
    });
  }

  void _onDisplay(String name){
    setState(() {
      _username = name;
    });

  }

  @override
  void initState() {
    _isAuthenticated = false;
    _username = '';

  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Name here'),
      ),
      body: new Container(
        padding: new EdgeInsets.all(32.0),
        child: Center(
          child: Column(
            children: <Widget>[
              MyWidget(),
              Clock(),
              TimeCounter(),
              Login(
                onAuthenticated: onAuthenticate,
                onSend: _onDisplay,
              ),
              Text('Authenticated: $_isAuthenticated'),
              Text('User: $_username'),
            ],
          ),
        ),
      ),
    );
  }
}