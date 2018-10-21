import 'package:flutter/material.dart';
import 'dart:async';

import 'package:intl/intl.dart';

class Clock extends StatefulWidget {

  @override
  State createState() {
    return _ClockState();
  }
}

class _ClockState extends State<Clock> {

  String _timeStr = 'Time here...';
  Timer _timer;


  @override
  void initState() {
    _timer = Timer.periodic(Duration(seconds: 1), _onTimer);
  }

  void _onTimer(Timer timer) {
    DateTime now = DateTime.now();
    DateFormat dateFormat = DateFormat('hh:mm:ss');
    String dateStr = dateFormat.format(now);
    setState(() {
      _timeStr = dateStr;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Text('$_timeStr',
      style: TextStyle(
        fontSize: 32.0,
        fontWeight: FontWeight.bold
      ),
    );
  }

}