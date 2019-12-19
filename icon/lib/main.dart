import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Icon',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeWidget(),
    );
  }
}

class HomeWidget extends StatelessWidget{
  @override 
  Widget build(BuildContext context){
    Row row1 = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        const Icon(Icons.add),
        const Text("Default size 24, default color black"),
      ],
    );
    Row row2 = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        const Icon(Icons.add, size: 48),
        const Text("Specified size 48, default color black"),
      ],
    );
    Row row3 = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        const Icon(Icons.add,size: 96, color: Colors.red),
        const Text("Specified size 96, specified color red"),
      ],
    );
    return Scaffold(
      appBar: AppBar(title: Text("Icons")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[row1, row2, row3],
      )
    );
  }
}

