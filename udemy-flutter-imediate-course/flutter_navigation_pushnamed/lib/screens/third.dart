import 'package:flutter/material.dart';

class Third extends StatefulWidget {
  @override
  State createState() => _ThirdState();
}

class _ThirdState extends State<Third> {
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
              Text('Third Page'),
              RaisedButton(
//                onPressed: () => Navigator.of(context).pushNamed('/Second'),
//                onPressed: () => Navigator.of(context).pop(),
                onPressed: () {
                  if(Navigator.of(context).canPop()){
                    Navigator.of(context).pop();
                  } else {
                    Navigator.of(context).pushNamed("/Second");
                  }
                },
                child: Text('Back'),
              )
            ],
          ),
        ),
      ),
    );
  }
}