import 'package:flutter/material.dart';

void main() => runApp(ColumnSpacedEvenly());

class ColumnSpacedEvenly extends StatelessWidget {
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
    RawMaterialButton redButton = RawMaterialButton(
      constraints: BoxConstraints(
        minWidth: 188.0,
        minHeight: 136.0
      ),
      onPressed: () {},
      shape: CircleBorder(),
      elevation: 2.0,
      fillColor: Colors.red,
      padding: EdgeInsets.all(15.0),
    );
    
    RawMaterialButton greenButton = RawMaterialButton(
      constraints: BoxConstraints(
        minWidth: 188.0,
        minHeight: 136.0
      ),
      onPressed: () {},
      shape: CircleBorder(),
      elevation: 2.0,
      fillColor: Colors.green,
      padding: EdgeInsets.all(15.0),
    );

    RawMaterialButton blueButton = RawMaterialButton(
      constraints: BoxConstraints(
        minWidth: 188.0,
        minHeight: 136.0
      ),
      onPressed: () {},
      shape: CircleBorder(),
      elevation: 2.0,
      fillColor: Colors.blue,
      padding: EdgeInsets.all(15.0),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text('Column Spaced Evenly'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            redButton,
            greenButton,
            blueButton,
          ],
        ),
      ),
    );
  }
}


