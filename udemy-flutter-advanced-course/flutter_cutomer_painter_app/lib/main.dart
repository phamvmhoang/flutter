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
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar:  AppBar(
        title:  Text('Flutter Custom Painter'),
      ),
      body:  Container(
        padding:  EdgeInsets.all(32.0),
        child:  Center(
          child: Column(
            children: <Widget>[
              CustomPaint(
                painter: _CustomPainter(),
              ),
              Text('Hoang Pham', style: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold
              )),
            ],
          ),
        ),
      ),
    );
  }
}

class _CustomPainter extends CustomPainter {

  @override
  void paint(Canvas canvas, Size size) {
    /*
    * final radius = 100.0;
    final Offset offset = new Offset(0.0, 75.0);
    final Paint paint = new Paint()
      ..isAntiAlias = true
      ..strokeWidth = 10.0
      ..color = Colors.blue[500]
     ..style = PaintingStyle.stroke;

    final Offset bodystart = new Offset(0.0, 50.0);
    final Offset bodyend = new Offset(0.0, 0.0);

    canvas.drawCircle(offset, radius, paint);
    canvas.drawLine(bodystart, bodyend, paint);

    final Rect rect = new Rect.fromCircle(center: offset, radius: radius);
    final Paint rectpaint = new Paint()
      ..isAntiAlias = true
      ..strokeWidth = 10.0
      ..color = Colors.orange
      ..style = PaintingStyle.stroke;

    canvas.drawRect(rect, rectpaint);
    * */
    final radius = 100.0;
    final Offset offset = Offset(0.0, 75.0);
    final Offset bodystart = new Offset(0.0, 50.0);
    final Offset bodyend = new Offset(0.0, 0.0);
    
    final Paint paint = Paint()
      ..isAntiAlias = true
      ..strokeWidth = 10.0
      ..color = Colors.blue[500]
      ..style = PaintingStyle.stroke;

    canvas.drawCircle(offset, radius, paint);

    final Rect rect = Rect.fromCircle(center: offset, radius: radius);
    final Paint recPaint = Paint()
      ..isAntiAlias = true
      ..strokeWidth = 10.0
      ..color = Colors.orange[500]
      ..style = PaintingStyle.stroke;
    canvas.drawRect(rect, recPaint);
    canvas.drawLine(bodystart, bodyend, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }



}