import 'package:flutter/material.dart';
import 'dart:async';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp( MaterialApp(
    home:  MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  _State createState() =>  _State();
}

class _State extends State<MyApp> {

  void _showUrl(){
    _launch('https://vnexpress.net');
  }

  void _showEmail(){
//    _launch('mailto:pvmhoang@gmail.com');
    _launch('mailto:frank@wwdcdemo.example.com');
  }

  void _showSMS(){
    _launch('sms:0902841910');
  }

  void _showPhone(){
  _launch('tel:0902841910');
  }

  void _launch(String urlString) async {
    if(await canLaunch(urlString)){
      await launch(urlString);
    } else {
      throw "Could not launch url";
    }
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar:  AppBar(
        title:  Text('Flutter URL Launcher'),
      ),
      body:  Container(
        padding:  EdgeInsets.all(32.0),
        child:  Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              RaisedButton(onPressed: _showUrl, child: Text('URL')),
              RaisedButton(onPressed: _showEmail, child: Text('Email')),
              RaisedButton(onPressed: _showSMS, child: Text('SMS')),
              RaisedButton(onPressed: _showPhone, child: Text('Phone')),
            ],
          ),
        ),
      ),
    );
  }
}