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
  String computeListOfTimestamps(int count) {
    StringBuffer sb = StringBuffer();
    for(int i = 0; i < count; i++){
      sb.writeln('${i + 1} : ${DateTime.now()}');
    }
    return sb.toString();
  }

  Future<String> createFutureCalculation(int count){
    return Future(() {
      return computeListOfTimestamps(count);
    });
  }


  HomeWidget({Key key}) : super(key: key);

  @override 
  _HomeWidgetState createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget>{
  bool _showCalculation = false;

  void _onInvokeFuturePressed(){
    setState(() {
      _showCalculation = !_showCalculation;
    });
  }

  @override 
  Widget build(BuildContext context){
    Widget child = _showCalculation ? FutureBuilder(
      future: widget.createFutureCalculation(10000),
      builder: (BuildContext context, AsyncSnapshot snapshot){
        return Expanded(
          child: SingleChildScrollView(
            child: Text(
              '${snapshot.data == null ? "" : snapshot.data}',
              style: TextStyle(
                fontSize: 20.0,
              ),
            ),
          ),
        );
      },
    )
    : Text('hit the button to show calculation');
    return Scaffold(
      appBar: AppBar(
        title: Text('Future'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[child],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _onInvokeFuturePressed,
        tooltip: 'Invoke Future',
        child: Icon(Icons.refresh),
      ),
    );
  }
}




