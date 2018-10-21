import 'package:flutter/material.dart';

class Login extends StatefulWidget {

  final ValueChanged<bool> onAuthenticated;
  final ValueChanged<String> onSend;

  Login({Key key, this.onAuthenticated, this.onSend});

  @override
  State createState() => _LoginState(onAuthenticated: onAuthenticated, onSend: onSend);
}

class _LoginState extends State<Login> {

  TextEditingController _user;
  TextEditingController _pass;
  final ValueChanged<bool> onAuthenticated;
  final ValueChanged<String> onSend;

  _LoginState({Key key, this.onAuthenticated, this.onSend});


  void _onPressed (){
    if(_user.text == 'hoangpvm' && _pass.text == '123456'){
      onAuthenticated(true);
    } else {
      onAuthenticated(false);
    }
  }

  void _onSendPressed (){
    onSend(_user.text);
  }


  @override
  void initState() {
    _user = TextEditingController();
    _pass = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
          padding: EdgeInsets.all(15.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: _user,
              decoration: InputDecoration(
                labelText: 'User Name'
              ),
            ),
            TextField(
              controller: _pass,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Password'
              ),
            ),
            Padding(padding: EdgeInsets.all(10.0)),
            RaisedButton(
              child: Text('Login'),
              onPressed: _onPressed
            ),
            RaisedButton(
              child: Text('Send'),
              onPressed: _onSendPressed
            ),
          ],
        ),
      ),
    );
  }
}