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
  double _x, _y, _z;

  @override
  void initState() {
    _visible = true;
    _turn = 0;
    _value = 0.0;
    _x = 0.0;
    _y = 0.0;
    _z = 0.0;
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
                    fontSize: 24.0,
                    color: Colors.red
                  ),
                ),
              ),
              Text('Sun Shine'),
              Container(
                margin: EdgeInsets.all(16.0),
                padding: EdgeInsets.all(32.0),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.orange,
                    width: 2.0,
                  ),
                  gradient: RadialGradient(
                      colors: <Color>[
                        Colors.red,
                        Colors.yellow
                      ]
                  )
                ),
                child: Image.asset('images/smile.png')
              ),
              Container(
                child: Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Text('X'),
                        Slider(value: _x, onChanged: (double value) => setState( ()=> _x = value))
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Text('Y'),
                        Slider(value: _y, onChanged: (double value) => setState( ()=> _y = value))
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Text('Z'),
                        Slider(value: _z, onChanged: (double value) => setState( ()=> _z = value))
                      ],
                    ),
                    Transform(
                      transform: Matrix4.skewY(_y),
                      child: Transform(
                        transform: Matrix4.skewX(_x),
                        child: Transform(
                          transform: Matrix4.rotationZ(_z),
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text('Hello World'),
                          )
                        )
                      ),

                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}