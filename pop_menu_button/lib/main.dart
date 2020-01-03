import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(MyApp());

enum PopupMenuAction {add1, add10, add100, exit}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeWidget(title: 'Flutter Demo Home Page'),
    );
  }
}

class HomeWidget extends StatefulWidget{
  HomeWidget({Key key, this.title}) : super(key: key);

  final String title;

  @override 
  _HomeWidgetState createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget>{
  int _counter = 0;

  void _increment(int by){
    setState(() {
      _counter += by;
    });
  }

  void _onPopupMenuSelected(PopupMenuAction item){
    if(PopupMenuAction.exit == item){
      SystemChannels.platform.invokeMethod('SystemNavigator.pop');
    } else{
      _increment(PopupMenuAction.add1 == item ? 1 : PopupMenuAction.add10 == item ? 10 : 100);
    }
  }

  @override 
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: <Widget>[
          PopupMenuButton<PopupMenuAction>(
            onSelected: _onPopupMenuSelected,
            itemBuilder: (BuildContext context) => <PopupMenuEntry<PopupMenuAction>>[
              PopupMenuItem<PopupMenuAction>(
                value: PopupMenuAction.add1,
                child: Text('+1'),
              ),
              PopupMenuItem<PopupMenuAction>(
                value: PopupMenuAction.add10,
                child: Text('+10'),
              ),
              PopupMenuItem(
                value: PopupMenuAction.add100,
                child: Text('+100'),
              ),
              PopupMenuItem(
                value: PopupMenuAction.exit,
                child: Text('Exit'),
              ),
            ],
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('You have pushed the button this many times:'),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.display1,
            ),
          ],
        ),
      ),
    );
  }
}