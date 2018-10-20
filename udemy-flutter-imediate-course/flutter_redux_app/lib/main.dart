import 'package:flutter/material.dart';

import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';

// define action
enum Action {increment, decrement}

// define reducer
int reducer(int state, dynamic action){
  if(action == Action.increment) state++;
  if(action == Action.decrement) state--;
  return state;
}



void main() {

  //make store
  final sotre = Store<int>(reducer,initialState: 0);

  runApp(MaterialApp(
    home: MyApp(
        store: sotre
    ),
  ));
}

class MyApp extends StatelessWidget {

  final Store<int> store;

  MyApp({Key key, this.store});

  @override
  Widget build(BuildContext context) {

    return StoreProvider<int>(
      store: store,
      child: MaterialApp(
        title: 'Flutter Redux Sample',
        home: Scaffold(
          appBar: AppBar(
            title: Text('Flutter Redux Sample'),
          ),
          body: Container(
            padding: EdgeInsets.all(32.0),
            child: Center(
              child: Column(
                children: <Widget>[
                  // make connector
                  StoreConnector<int,String>(
                      builder: (BuildContext context, String count) {
                        return Text(count,
                          style: TextStyle(
                            fontSize: 24.0
                          ),
                        );
                      },
                      converter: (Store store) => store.state.toString()
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      IconButton(icon: Icon(Icons.add), onPressed: ()=> store.dispatch(Action.increment)),
                      IconButton(icon: Icon(Icons.remove), onPressed: ()=>store.dispatch(Action.decrement)),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

}