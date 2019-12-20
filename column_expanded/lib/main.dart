import 'package:flutter/material.dart';

void main() => runApp(ColumnExpanded());

class ColumnExpanded extends StatelessWidget {
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
  HomeWidget({Key key}) : super (key: key);

  @override 
  Widget build(BuildContext context){
      RawMaterialButton redButton = RawMaterialButton(
      onPressed: () {},
      elevation: 2.0,
      fillColor: Colors.red,
    );

    RawMaterialButton greenButton = RawMaterialButton(
      onPressed: () {},
      elevation: 2.0,
      fillColor: Colors.green,
    );

    RawMaterialButton blueButton = RawMaterialButton(
      onPressed: () {},
      elevation: 2.0,
      fillColor: Colors.blue,
    );

    return Scaffold(
      appBar: AppBar(
        title: Text('Column'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Expanded(child: redButton),
            Expanded(child: greenButton),
            Expanded(child: blueButton),
          ],
        ),
      ),
    );
  }
}

