import 'package:flutter/material.dart';

class MyWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Card(
      child: RaisedButton(
        child: Column(
          children: <Widget>[
            Text('Click to Navigate'),
            RaisedButton(
              child: Text('Cllck Me'),
              onPressed: () {
                Navigator.of(context).pushNamed('/Home');
              }
            )
          ],
        ) ,
        onPressed: null
      ),
    );
  }

}