import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() => runApp(flutter_new());

class flutter_new extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final WordPair wordPair = new WordPair.random();
    return new MaterialApp(
      title: "Welcome to name generator!!",
      home: new RandomWords(),
    );
  }
}

class RandomWords extends StatefulWidget {
  @override
  RandomWordsState createState() => new RandomWordsState();
}

class RandomWordsState extends State<RandomWords> {
  final List<WordPair> _suggestions = <WordPair>[];
  final TextStyle _biggerFont = const TextStyle(fontSize: 18.0);
  final Set<WordPair> _saved = new Set<WordPair>();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Startup Name Generator'),
      ),
      body: _buildSuggestions(),
    );
  }

  Widget _buildSuggestions() {
    return new ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemBuilder: (BuildContext context, int i) {
          if (i.isOdd) {
            return new Divider();
          }
          final int index = i ~/ 2;

          if (index >= _suggestions.length) {
            _suggestions.addAll(generateWordPairs().take(10));
          }

          return _buildRow(_suggestions[index]);
        });
  }

  Widget _buildRow(WordPair pair) {
    final bool alreadySaved = _saved.contains(pair);
    return new ListTile(
      title: new Text(
        pair.asPascalCase,
        style: _biggerFont,
      ),
      trailing: Icon(
        alreadySaved ? Icons.favorite_border: Icons.favorite_border,
        color:alreadySaved ? Colors.red : null,
      ),
    );
  }
}
