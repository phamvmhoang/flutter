import 'package:flutter/material.dart';

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

  bool _visible;
  int _turn;
  double _value;

  @override
  void initState() {
    _visible = true;
    _turn = 0;
    _value = 0.0;
  }

  void _toggleVisible(){
    setState(() {
      _visible = !_visible;
    });
  }

  void _onChangehandler(double value){
    setState(() {
      _value = value;
      _turn = value.toInt();
    });
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar:  AppBar(
        title:  Text('Flutter Opacity Sample'),
      ),
      body:  Container(
        padding:  EdgeInsets.all(32.0),
        child:  Center(
          child: Column(
            children: <Widget>[
              Opacity(
                opacity: _visible ? 1.0 : 0.2,
                child: Text('Do you see me!!!'),
              ),
              RaisedButton(
                onPressed: _toggleVisible,
                child: Text('Toggle Visible'),
              ),
              Slider(
                  value: _value,
                  min: 0.0,
                  max: 4.0,
                  onChanged: _onChangehandler
              ),
              RotatedBox(
                quarterTurns: _turn,
                child: Text('FLutter Rote Rox...',
                  style: TextStyle(
                    fontSize: 28.0,
                    color: Colors.red
                  ),
                ),
              )
              
            ],
          ),
        ),
      ),
    );
  }
}