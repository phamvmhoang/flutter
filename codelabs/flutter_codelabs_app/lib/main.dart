import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final wordpair = WordPair.random();

    return MaterialApp(
      title: 'Startup Name Generator',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Startup Name Generator'),
        ),
        body: RandomWords(),
      ),
    );
  }
}

class RandomWordsState extends State<RandomWords> {

  final List<WordPair> _suggestions = <WordPair>[];
  final TextStyle _biggerFont = TextStyle(fontSize: 18.0);

  @override
  Widget build(BuildContext context) {
    final wordpair = WordPair.random();
    return _buildSuggestions();
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
    return ListTile(
      title: Text(wordpair.asPascalCase,
          style: _biggerFont,
      ),
    );
  }


}


class RandomWords extends StatefulWidget {

  @override
  State createState() => RandomWordsState();

}