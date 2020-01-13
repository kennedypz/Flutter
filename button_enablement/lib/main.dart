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
      home: HomeWidget(title: 'Button Enablement'),
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
  bool _checked = false;

  void _onCheck(val){
    setState(() {
      _checked = val;
    });
  }

  void _onSubmit(){
    debugPrint('_onSubmit');
  }

  @override 
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text(
              'Please check below to agree to the terms.',
              style: TextStyle(
                fontStyle: FontStyle.italic
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Checkbox(
                  value: _checked,
                  onChanged: (val) => _onCheck(val),
                ),
                Text('Agree'),
              ],
            ),
            OutlineButton(
              onPressed: _checked ? () => _onSubmit() : null,
              child: Text('Register'),
            ),
          ],
        ),
      ),
    );
  }
}

