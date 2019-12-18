import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Styled text Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class TextBlock{
  final Color _color;
  final String _text;

  TextBlock(this._color, this._text);

  String get text => _text;
  Color get color => _color;
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _index = 0;

  final List<TextBlock> textBlocks = [
    TextBlock(Colors.red, "Every"),
    TextBlock(Colors.redAccent, "schoolboy"),
    TextBlock(Colors.green, "\nknows"),
    TextBlock(Colors.greenAccent, "who"),
    TextBlock(Colors.blue, "\nimprisoned"),
    TextBlock(Colors.blueAccent, "\nMontezuma")
  ];

  void _incrementCounter() {
    setState(() {
      if(_index < textBlocks.length){
        _index++;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<TextSpan> textSpans = List<TextSpan>();
    for(var i = 0; i < _index; i++){
      TextBlock textBlock = textBlocks[i];
      textSpans.add(TextSpan(
        text: textBlock.text,
        style: TextStyle(
          color: textBlock.color,
          fontSize: 32.0
        )
      ));
    }
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text.rich(TextSpan(children: textSpans)),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.note_add),
      ),
    );
  }
}
