import 'package:flutter/material.dart';

void main() => runApp(StackPleaseWaitAppWidget());

class StackPleaseWaitAppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeWidget(title: 'Card Layout Demo'),
    );
  }
}

class HomeWidget extends StatefulWidget{
  HomeWidget({Key key, this.title}) : super(key: key);

  final String title;

  final PleaseWaitWidget _pleaseWaiteWidget = PleaseWaitWidget(key: ObjectKey('pleaseWaitWidget'));

  final AppWidget _appWidget = AppWidget(key: ObjectKey('appWidget'));

  @override 
  _HomeWidgetState createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget>{
  bool _pleaseWait = false;

  _togglePleaseWait(){
    setState(() {
      _pleaseWait = !_pleaseWait;
    });
  }

  @override 
  Widget build(BuildContext context){
    List<Widget> childWidgets = _pleaseWait ? [widget._pleaseWaiteWidget, widget._appWidget] : [widget._appWidget];
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Stack(
          key: ObjectKey('stack'),
          children: childWidgets,
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => _togglePleaseWait(),
        label: Text('Please Wait On/Off'),
        icon: Icon(Icons.cached),
      ),
    );
  }
}

class PleaseWaitWidget extends StatelessWidget{
  PleaseWaitWidget({Key key}) : super(key: key);

  @override 
  Widget build(BuildContext context){
    return Container(
      child: Center(
        child: CircularProgressIndicator(
          strokeWidth: 8.0,
        ),
      ),
      color: Colors.grey.withOpacity(0.3),
    );
  }
}

class AppWidget extends StatelessWidget{
  AppWidget({Key key}) : super(key: key);

  @override 
  Widget build(BuildContext context){
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Text(
            'Your',
            style: TextStyle(
              fontSize: 20.0,
            ),
          ),

          Text(
            'App',
            style: TextStyle(
              fontSize: 20.0
            ),
          ),

          Text(
            'Goes',
            style: TextStyle(
              fontSize: 20.0,
            ),
          ),

          Text(
            'Here',
            style: TextStyle(
              fontSize: 20.0
            ),
          ),
        ],
      ),
    );
  }
}
