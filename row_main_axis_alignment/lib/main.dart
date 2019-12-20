import 'package:flutter/material.dart';

void main() => runApp(RowMainAxisAlignmentApp());

class RowMainAxisAlignmentApp extends StatelessWidget {
  // This widget is the root of your application.
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
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('MainAxisAlignment'),
              Text('is'),
              Text('center')
            ],
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Text('MainAxisAlignment'),
              Text('is'),
              Text('end')
            ],
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Text('MainAxisAlignment'),
              Text('is'),
              Text('spaceAround')
            ],
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Text('MainAxisAlignment'),
              Text('is'),
              Text('spaceEvenly')
            ],
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text('MainAxisAlignment'),
              Text('is'),
              Text('spaceBetween')
            ],
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Text('MainAxisAlignment'),
              Text('is'),
              Text('start')
            ],
          ),
        ],
      ),
    );
  }
}