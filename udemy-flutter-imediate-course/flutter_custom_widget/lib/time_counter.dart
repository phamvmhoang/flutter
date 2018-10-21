import 'package:flutter/material.dart';
import 'dart:async';

import 'package:intl/intl.dart';

import 'time_display.dart';

class TimeCounter extends StatefulWidget {

  @override
  State createState() => _TimeCounterState();

}

class _TimeCounterState extends State<TimeCounter> {

  Stopwatch _stopwatch;
  Timer _timer;
  Duration _duration;

  void onStart(){
    setState(() {
      if(_stopwatch == null){
        _stopwatch = Stopwatch();
      }
      _timer = Timer.periodic(Duration(microseconds: 250),onTimeout);
    });
    _stopwatch.start();
  }

  void onStop(){
    _timer.cancel();
    _stopwatch.stop();
  }

  void onTimeout(Timer timer){
    if(!_stopwatch.isRunning) return;
    setState(() {
      _duration = _stopwatch.elapsed;
    });
  }

  void onClear(Duration){
    setState(() {
      _duration = Duration();
    });
  }

  @override
  void initState() {
    _duration = Duration();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: <Widget>[
            TimeDisplay(
              color: Colors.red,
              duration: _duration,
              onClear: onClear,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: RaisedButton(
                    child: Text('Start'),
                    onPressed: onStart
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: RaisedButton(
                    child: Text('Stop'),
                    onPressed: onStop
                  ),
                ),
              ],
            )
          ],
        ),

      ),
    );
  }
}