import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

const String _name = 'hoangpvm';

void main() => runApp(FriendlychatApp());

final ThemeData kIOSTheme = ThemeData(
  primarySwatch: Colors.orange,
  primaryColor: Colors.grey[200],
  primaryColorBrightness: Brightness.light
);

final ThemeData kDefaultTheme = ThemeData(
    primaryColor: Colors.purple,
    accentColor: Colors.orangeAccent[400],
);


var defaultTargetPlatform = TargetPlatform.iOS;

class FriendlychatApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Friendlychat',
      theme: defaultTargetPlatform == TargetPlatform.iOS ? kIOSTheme: kDefaultTheme,
      home: ChatScreen()
    );
  }
}

class ChatScreenState extends State<ChatScreen> with TickerProviderStateMixin{

  final List<ChatMessage> _messages = <ChatMessage>[];
  TextEditingController _textEditingController = TextEditingController();
  bool _isComposing = false;


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
                onChanged: (String data) {
                  setState(() {
                    _isComposing = data.length >0;
                  });
                },
                onSubmitted: _handleSubmitted,
                decoration: InputDecoration.collapsed(
                  hintText: 'input a message'
                ),

              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 4.0),
              child: Theme.of(context).platform == TargetPlatform.iOS ?
              CupertinoButton(
                  child: Text('Send'),
                  onPressed: _isComposing? ()=>_handleSubmitted(_textEditingController.text) : null
              )
              :
              IconButton(
                  icon: Icon(Icons.send),
//                  color: Colors.redAccent,
                  onPressed: _isComposing? ()=>_handleSubmitted(_textEditingController.text) : null
              ),
            )
          ],
        ),
      ),
    );
  }

  void _handleSubmitted(String data){
    _textEditingController.clear();
    ChatMessage chatMessage = ChatMessage (
      text: data,
      animationController: AnimationController(
        duration: Duration(seconds: 1),
        vsync: this
      ),
    );
    setState(() {
      _messages.insert(0, chatMessage);
    });
    chatMessage.animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Friendlychat'),
          elevation: Theme.of(context).platform == TargetPlatform.iOS ? 0.0 : 4.0,
        ),
        body: Container(
          child: Column(
            children: <Widget>[
              Flexible(
                child: ListView.builder(
                  padding: EdgeInsets.all(8.0),
                  reverse: true,
                  itemCount: _messages.length,
                  itemBuilder: (_, int index)=> _messages[index]
                ),
              ),
              Divider(height: 1.0),
              Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).cardColor,
                ),
                child: _buildTextComposer()
              ),
            ],
          ),
          decoration: Theme.of(context).platform == TargetPlatform.iOS ?
            BoxDecoration(
              border: Border(
                top: BorderSide(
                  color: Colors.grey[200]
                )
              )
            )
            :
            null
          ,
        )
    );
  }

  @override
  void dispose() {
    for (ChatMessage  chatMessage in _messages) {
      chatMessage.animationController.dispose();
    }
    super.dispose();
  }
}

class ChatScreen extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    return ChatScreenState();
  }

}

class ChatMessage extends StatelessWidget {

  final String text;
  final AnimationController animationController;

  ChatMessage({this.text, this.animationController});

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: Tween(begin: 0.1, end: 1.0).animate(animationController),
      /*sizeFactor: CurvedAnimation(
          parent: animationController,
          curve: Curves.bounceOut
      ),*/
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(right: 16.0),
              child: CircleAvatar(
                child: Text(_name[0]),
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('Your Name',
                    style: Theme.of(context).textTheme.subhead,
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 5.0),
                    child: Text(text)
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
  
}