import 'package:flutter/material.dart';

class TimeDisplay extends StatelessWidget {

  Duration duration;
  Color color = Colors.green;
  final ValueChanged<Duration> onClear;

  TimeDisplay({Key key, Duration this.duration, Color this.color, ValueChanged<Duration> this.onClear}): super(key: key);

  void onClicked (){
    onClear(Duration());
  }


  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(5.0),
          child: Text(duration.toString(),
            style: TextStyle(
              fontSize: 32.0,
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
        ),
        IconButton(
            icon: Icon(Icons.clear),
            onPressed: onClicked
        )
      ],
    );
  }
}