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

class _State extends State<MyApp> with TickerProviderStateMixin{

  Animation animation;
  AnimationController animationController;

  @override
  void initState() {
    super.initState();

    animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 10000)
    );

    final CurvedAnimation curvedAnimation = CurvedAnimation(
        parent: animationController,
        curve: Curves.bounceInOut
    );
    animation = Tween(begin: 0.0, end: 300.0).animate(curvedAnimation);

    animationController.forward();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    animationController.dispose();
  }

  Widget builder(BuildContext context, Widget child){
    return Container(
      height: animation.value,
      width: animation.value,
      child: FlutterLogo(
        size: 300.0,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar:  AppBar(
        title:  Text('Flutter Animation Builder'),
      ),
      body:  Container(
        padding:  EdgeInsets.all(32.0),
        child:  Center(
          child: AnimatedBuilder(
              animation: animation,
              builder: builder
          ),
        ),
      ),
    );
  }
}