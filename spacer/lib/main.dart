import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePageWidget(),
    );
  }
}

class HomePageWidget extends StatelessWidget{
  HomePageWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          Spacer(),
          Center(
            child: Text(
              'Spacer',
              style: TextStyle(
                fontSize: 20
              ),
            ),
          ),
          Spacer(flex: 5),
          IconButton(
            icon: Icon(Icons.settings_overscan),
            onPressed: () => {},
          ),
          IconButton(
            icon: Icon(Icons.settings_overscan),
            onPressed: () => {},
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Dummy')
          ],
        ),
      ),
    );
  }
}