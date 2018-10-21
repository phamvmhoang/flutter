import 'package:flutter/material.dart';

import 'mywidget.dart';

class Second extends StatefulWidget {
  @override
  State createState() => _SecondState();
}

class _SecondState extends State<Second> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Name here'),
      ),
      body: Container(
        padding: EdgeInsets.all(32.0),
        child: Center(
          child: Column(
            children: <Widget>[
              Text('Second Page'),
              RaisedButton(
                onPressed: () => Navigator.of(context).pushNamedAndRemoveUntil('/Third', (_)=>false),
                child: Text('Next'),
              ),
              RaisedButton(
                onPressed: () => Navigator.of(context).pop(),
                child: Text('Back'),
              ),
              MyWidget()
            ],
          ),
        ),
      ),
    );
  }
}