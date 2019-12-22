import 'package:flutter/material.dart';

void main() => runApp(RowWithExpandedApp());

class RowWithExpandedApp extends StatelessWidget {
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

class HomeWidget extends StatelessWidget{
  HomeWidget({Key key}) : super(key: key);

  @override 
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('Rows'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Text('None expanded'),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('aaaaaaaaaa'),
              Text('bbbbbbbbbbb'),
              Text('ccccccccc'),
            ],
          ),
          Text('1st child expanded'),
          Row(
            children: <Widget>[
              Expanded(child: Text('aaaaaaaaaa'),),
              Text('bbbbbbbbbb'),
              Text('cccccccccc'),
            ],
          ),
          Text('2nd child expanded'),
          Row(
            children: <Widget>[
              Text('aaaaaaaaaa'),
              Expanded(child: Text('bbbbbbbbbb'),),
              Text('cccccccccc'),
            ],
          ),
          Text('3rd child expanded'),
          Row(
            children: <Widget>[
              Text('aaaaaaaaaa'),
              Text('bbbbbbbbbb'),
              Expanded(child: Text('cccccccccc'),),
            ],
          ),
        ],
      ),
    );
  }
}