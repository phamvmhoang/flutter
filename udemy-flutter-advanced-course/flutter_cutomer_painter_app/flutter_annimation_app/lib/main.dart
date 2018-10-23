import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';

void main() {
  runApp( MaterialApp(
    home:  MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  _State createState() =>  _State();
}

class _State extends State<MyApp> with SingleTickerProviderStateMixin {

  Animation<double> animation;
  AnimationController animationController;


  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: Duration(
        milliseconds: 5000,
      ),
    );

    animation = Tween(
        begin: 0.0,
        end: 400.0
    ).animate(animationController);

    animation.addListener((){
      setState(() {

      });
    });

    animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar:  AppBar(
        title:  Text('Name here'),
      ),
      body:  Container(
        padding:  EdgeInsets.all(32.0),
        height: animation.value,
        width: animation.value,
        child:  Center(
          child: FlutterLogo(
            size: 300.0,
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    animationController.dispose();
  }
}