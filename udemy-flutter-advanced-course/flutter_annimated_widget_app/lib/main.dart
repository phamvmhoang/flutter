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

class _State extends State<MyApp> with TickerProviderStateMixin {

  Animation animation;
  AnimationController animationController;


  @override
  void initState() {
    animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 2000)
    );
    animation = CurvedAnimation(parent: animationController, curve: Curves.easeIn);

    animation.addStatusListener(listener);
    animationController.forward();

  }

  void listener(AnimationStatus status) {
    if(status == AnimationStatus.completed){
      animationController.reverse();
    } else if(status == AnimationStatus.dismissed){
      animationController.forward();
    }

  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar:  AppBar(
        title:  Text('Flutter Animated Widget'),
      ),
      body:  Container(
        padding:  EdgeInsets.all(32.0),
        child: AnimatedLogo(animation: animation),
      ),
    );
  }

}

class AnimatedLogo extends AnimatedWidget {

  static final _opacityTween = Tween<double>(begin: 0.1, end: 1.0);
  static final _sizeTween = Tween<double>(begin: 0.0, end: 300.0);
  static final _rotateTween = Tween<double>(begin: 0.0, end: 12.0);

  AnimatedLogo({Key key, Animation<double> animation}):super(key: key, listenable: animation);

  @override
  Widget build(BuildContext context) {

    final Animation<double> animation = listenable;

    return Center(
      child: Transform.rotate(
        angle: _rotateTween.evaluate(animation),
        child: Opacity(
          opacity: _opacityTween.evaluate(animation),
          child: Container(
            margin: EdgeInsets.symmetric( vertical: 10.0),
            height: _sizeTween.evaluate(animation),
            width: _sizeTween.evaluate(animation),
            child: FlutterLogo(
              size: 300.0,
            ),
          ),
        ),
      ),
    );
  }

}