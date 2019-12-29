import 'package:flutter/material.dart';
import 'dart:math';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class CirclePainter extends CustomPainter{
  final _random = Random();
  List<Color> _colors = [];

  CirclePainter(){
    for(int i = 0; i < 100; i++){
      _colors.add(
        Colors.green.withRed(next(0, 255)).withGreen(next(0, 255)).withBlue(next(0, 255))
      );
    }
  }

  int next(int min, int max) => min + _random.nextInt(max - min);

  @override 
  void paint(Canvas canvas, Size size){
    for(int i = 0; i < 100; i++){
      var radius = (i * 10).toDouble();
      canvas.drawCircle(
        Offset(1000.0, 1000.0),
        radius,
        Paint()..color = _colors[i]..strokeCap = StrokeCap.round..style = PaintingStyle.stroke..strokeWidth = 15.0
      );
    }
  }

  @override 
  bool shouldRepaint(CirclePainter oldDelegate){
    return false;
  }
}

class MyHomePage extends StatelessWidget{
  final CirclePainter circlePainter = CirclePainter();
  MyHomePage({Key key}) : super(key: key);

  @override 
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('Scroll'),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        physics: AlwaysScrollableScrollPhysics(),
        child: CustomPaint(
          size: Size(2000.0, 2000.0),
          foregroundPainter: circlePainter,
        ),
      ),
    );
  }
}