import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Startup Name Generator',
      home: RandomWords(),
      theme: ThemeData(
        primaryColor: Colors.white
      ),
    );
  }
}

class RandomWordsState extends State<RandomWords> {

  final List<WordPair> _suggestions = <WordPair>[];
  final Set<WordPair> _saved = Set<WordPair>();
  final TextStyle _biggerFont = TextStyle(fontSize: 18.0);

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Startup Name Generator',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Startup Name Generator'),
//          backgroundColor: Colors.white,
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.list) ,
              onPressed: _pushSaved,
            ),
          ],
        ),
        body: _buildSuggestions(),
      ),
    );
    //return _buildSuggestions();
  }

  Widget _buildSuggestions() {
    return ListView.builder(
      padding: EdgeInsets.all(16.0),
      itemBuilder: (BuildContext context, int index) {
        if(index.isOdd){
          return Divider( color: Colors.grey,);
        }
        final int i = index ~/ 2;
        if(i >= _suggestions.length){
          _suggestions.addAll(generateWordPairs().take(10));
        }
        return _buildRow(_suggestions[i]);
      },

    );
  }

  Widget _buildRow(WordPair wordpair) {
    final bool alreadySaved = _saved.contains(wordpair);
    return ListTile(
      title: Text(wordpair.asPascalCase,
          style: _biggerFont,
      ),
      trailing: Icon( alreadySaved ? Icons.favorite: Icons.favorite_border,
          color: alreadySaved ? Colors.red : null),
      onTap: () {
        setState(() {
          if(alreadySaved){
            _saved.remove(wordpair);
          } else {
            _saved.add(wordpair);
          }
        });
      },
    );
  }

  void _pushSaved() {
    Navigator.of(context)
        .push(MaterialPageRoute(
        builder: (BuildContext buildContext) {
          final Iterable<ListTile> tiles = _saved.map((WordPair wordpair) {
            return ListTile(
              title: Text(wordpair.asPascalCase,
                style: _biggerFont,
              ),
            );
          });

          final List<Widget> dividers = ListTile.divideTiles(
            context: buildContext,
            tiles: tiles
          ).toList();

          return Scaffold(
            appBar: AppBar(
              title: Text('Saved Suggestions'),
            ),
            body: ListView(
              children: dividers,
            ),
          );
        }
    ));
  }

}


class RandomWords extends StatefulWidget {

  @override
  State createState() => RandomWordsState();

}