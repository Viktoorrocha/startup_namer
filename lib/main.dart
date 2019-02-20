import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {



  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Startup Generator',
      home: new RandomWords(),
    );

    }
  }


class RandomWords extends StatefulWidget {
  @override
  RandomWordsState createState() => new RandomWordsState();
}

class RandomWordsState extends State<RandomWords> {
  @override
  final List<WordPair> _suggestions = <WordPair>[];
  final TextStyle _biggerFont = const TextStyle(fontSize: 18.0);
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Startup Name Generator"),
      ),
      body: _buildSuggestions(),
    );
  }

  Widget _buildSuggestions() {
    return new ListView.builder(
        padding: const EdgeInsets.all(16.0),

        itemBuilder: (BuildContext _context, int i) {

          if (i.isOdd) {
            return new Divider();
          }

          final int index = i ~/ 2;
          // If you've reached the end of the available word
          // pairings...
          if (index >= _suggestions.length) {
            // ...then generate 10 more and add them to the
            // suggestions list.
            _suggestions.addAll(generateWordPairs().take(10));
          }
          return _buildRow(_suggestions[index]);
        }
    );
  }

  Widget _buildRow(WordPair pair) {
    return new ListTile(
      title: new Text(
        pair.asPascalCase,
        style: _biggerFont,
      ),
    );
  }

}
