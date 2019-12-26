import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeWidget(),
    );
  }
}

class HomeWidget extends StatefulWidget{
  HomeWidget({Key key}) : super(key: key);

  @override 
  _HomeWidgetState createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget>{
  static const double TWENTY = 20.0;
  static const List<String> _titles = [
    'all 20.0',
    'left 20.0',
    'right 20.0',
    'top 20.0',
    'bottom 20.0',
    'sym horiz 20.0',
    'syn vert 20.0'
  ];

  static const List<EdgeInsets> _edgeInsets = [
    const EdgeInsets.all(TWENTY),
    const EdgeInsets.only(left: TWENTY),
    const EdgeInsets.only(right: TWENTY),
    const EdgeInsets.only(top: TWENTY),
    const EdgeInsets.only(bottom: TWENTY),
    const EdgeInsets.symmetric(horizontal: TWENTY),
    const EdgeInsets.symmetric(vertical: TWENTY)
  ];

  int _index = 0;
  final Container _childContainer = Container(color: Colors.blue);

  void _next(){
    setState(() {
      _index++;
      if(_index >= _titles.length){
        _index = 0;
      }
    });
  }

  @override 
  Widget build(BuildContext context){
    Padding padding = Padding(
      padding:_edgeInsets[_index],
      child: _childContainer,
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(_titles[_index]),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: () => _next(),
          ),
        ],
      ),
      body: Center(
        child: Container(
          child: padding,
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.blueAccent
            )
          ),
        ),
      ),
    );
  }
}

