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

class _State extends State<MyApp> with TickerProviderStateMixin {

  Animation animation;
  AnimationController animationController;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 5000)
    );

    final CurvedAnimation curve = CurvedAnimation(
        parent: animationController,
        curve: Curves.easeIn
    );

    animation = Tween(begin: 100.0, end: 300.0).animate(curve);
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
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    animationController.dispose();
  }

  Widget builder (BuildContext context, Widget child){
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
        title:  Text('Name here'),
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