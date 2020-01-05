import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var num1 = 0, num2 = 0, result = 0;

  final TextEditingController t1 = TextEditingController();
  final TextEditingController t2 = TextEditingController();

  void doAddition(){
    setState(() {
      num1 = int.parse(t1.text);
      num2 = int.parse(t2.text);
      result = num1 + num2;
    });
  }

  void doSubtraction(){
    setState(() {
      num1 = int.parse(t1.text);
      num2 = int.parse(t2.text);
      result = num1 - num2;
    });
  }

  void doMultiplication(){
    setState(() {
      num1 = int.parse(t1.text);
      num2 = int.parse(t2.text);
      result = num1 * num2;
    });
  }

  void doDivision(){
    setState(() {
      num1 = int.parse(t1.text);
      num2 = int.parse(t2.text);
      result = num1 ~/ num2; // (~/ = Truncate)
    });
  }

  void doClear(){
    setState(() {
      t1.text = '';
      t2.text = '';
      result = 0;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculator'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(40.0),
        children: <Widget>[ Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
              Text(
                'Output: $result',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.grey,
                  fontWeight: FontWeight.bold
                ),
              ),  
              TextField(
                controller: t1,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: 'Enter the first number'
                ),
              ),
              TextField(
                controller: t2,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: 'Enter the second number'
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20.0),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  MaterialButton(
                    color: Colors.redAccent,
                    child: Text(
                      '+', 
                      style: TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    onPressed: doAddition,
                  ),
                  MaterialButton(
                    color: Colors.redAccent,
                    child: Text(
                      '-',
                      style: TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                      ),  
                    ),
                    onPressed: doSubtraction,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  MaterialButton(
                    color: Colors.redAccent,
                    child: Text(
                      '*',
                      style: TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    onPressed: doMultiplication,
                  ),
                  MaterialButton(
                    color: Colors.redAccent,
                    child: Text(
                      '/',
                      style: TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                      ),  
                    ),
                    onPressed: doDivision,
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(top: 20.0),
                child: MaterialButton(
                  color: Colors.redAccent,
                  child: Text(
                      'Clear',
                      style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),  
                  ),
                  onPressed: doClear,
                ),
              ),
            ],
          ),
        ]
      ),
    );
  }
}