import 'package:flutter/material.dart';

void main() => runApp(FriendlychatApp());

class FriendlychatApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Friendlychat',
      home: ChatScreen()
    );
  }
}

class ChatScreenState extends State<ChatScreen> {

  TextEditingController _textEditingController = TextEditingController();


  Widget _buildTextComposer(){
    return IconTheme(
      data: IconThemeData(color: Theme.of(context).accentColor),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 8.0),
        child: Row(
          children: <Widget>[
            Flexible(
              child: TextField(
                controller: _textEditingController,
                onSubmitted: _handleSubmitted,
                decoration: InputDecoration.collapsed(
                  hintText: 'input a message'
                ),

              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 4.0),
              child: IconButton(
                  icon: Icon(Icons.send),
//                  color: Colors.redAccent,
                  onPressed: () => _handleSubmitted(_textEditingController.text)
              ),
            )
          ],
        ),
      ),
    );
  }

  void _handleSubmitted(String data){
    _textEditingController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Friendlychat'),
        ),
        body: Container(
          child: _buildTextComposer()
        )
    );
  }
}

class ChatScreen extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    return ChatScreenState();
  }

}