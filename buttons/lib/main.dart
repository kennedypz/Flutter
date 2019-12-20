import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Buttons',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeWidget(),
    );
  }
}

class HomeWidget extends StatelessWidget{
  const HomeWidget({Key key}) : super(key: key);
  
  @override 
  Widget build(BuildContext context){
    Row flatButtonRow = Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        FlatButton(
          onPressed: () => debugPrint('FlatButton pressed'),
          child: Text('FlatButton'),
        ),
        Text('FlatButton')
      ],
    );

    Row raisedButtonRow = Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        RaisedButton(
          onPressed: () => debugPrint('RaisedButton pressed'),
          child: Text('RaisedButton'),
        ),
        Text('RaisedButton'),
      ],
    );

    Row iconButtonRow = Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        IconButton(
          icon: Icon(Icons.add),
          onPressed: () => debugPrint('IconButton pressed'),
        ),
        Text('IconButton')
      ],
    );

    Row outlineButtonRow = Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        OutlineButton(
          onPressed: () => debugPrint('OutlineButton pressed'),
          child: Text('OutlineButton'),
        ),
        Text('OutlineButton'),
      ],
    );

    Row dropdownButtonRow = Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        DropdownButton<String>(
          items: <String>['Men', 'Women'].map((String value){
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          },
        ).toList(),
        onChanged: (value) => debugPrint('Changed: $value')),
        Text('DropdownButton'),
      ],
    );

    Row backArrowButtonRow = Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        BackButton(),
        Text('BackButton'),
      ],
    );

    Row closeButtonRow = Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        CloseButton(),
        Text('CloseButton'),
      ],
    );

    return Scaffold(
      appBar: AppBar(
        title: Text('Buttons'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            flatButtonRow,
            raisedButtonRow,
            iconButtonRow,
            outlineButtonRow,
            dropdownButtonRow,
            backArrowButtonRow,
            closeButtonRow,
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => debugPrint('FloatingActionButtton pressed'),
        child: Text('F.A.B'),
      ),
    );
  }
}