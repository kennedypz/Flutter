import 'package:flutter/material.dart';

void main() => runApp(ContainerApp());

class ContainerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeWidget(title: 'Flutter Demo Home Page'),
    );
  }
}

class HomeWidget extends StatefulWidget{
  HomeWidget({Key key, this.title}) : super(key: key);

  final String title;

  @override 
  _HomeWidgetState createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> with SingleTickerProviderStateMixin{
  Animation<double> _animation;
  AnimationController _controller;

  @override 
  void initState(){
    super.initState();
    _controller = AnimationController(
      duration: Duration(seconds: 2),
      vsync: this,
    );
    _animation = Tween<double>(
      begin: 0.0,
      end: 1.0
    ).animate(_controller)..addListener(() {
      setState(() {});
    });
  }

  @override 
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Container(
          child: RotationTransition(
            turns: AlwaysStoppedAnimation(_animation.value),
            child: Icon(Icons.airplanemode_active, size: 150.0),
          ),
          decoration: BoxDecoration(
            border: Border.all(
              width: 2.0,
              color: Colors.black,
            ),
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
            color: Colors.redAccent
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _spin,
        tooltip: 'Increment',
        child: Icon(Icons.rotate_right),
      ),
    );
  }

  void _spin(){
    _controller.forward(from: 0.0);
  }
}

