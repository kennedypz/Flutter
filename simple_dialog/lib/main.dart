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

class _HomeWidgetState extends State<HomeWidget>{
  BoxFit _boxFit = BoxFit.cover;

  void _showBoxFitDialog() async{
    BoxFit boxFit = await showDialog<BoxFit>(
      context: context,
      builder: (BuildContext context){
        return SimpleDialog(
          title: Text('Select Box Fit'),
          children: <Widget>[
            SimpleDialogOption(
              onPressed: () {
                Navigator.pop(context, BoxFit.cover);
              },
              child: Text('Cover'),
            ),
            SimpleDialogOption(
              onPressed: () {
                Navigator.pop(context, BoxFit.contain);
              },
              child: Text('Contain'),
            ),
            SimpleDialogOption(
              onPressed: () {
                Navigator.pop(context, BoxFit.fill);
              },
              child: Text('Fill'),
            ),
            SimpleDialogOption(
              onPressed: () {
                Navigator.pop(context, BoxFit.fitHeight);
              },
              child: Text('Fit Height'),
            ),
            SimpleDialogOption(
              onPressed: () {
                Navigator.pop(context, BoxFit.fitWidth);
              },
              child: Text('Fit Width'),
            ),
            SimpleDialogOption(
              onPressed: () {
                Navigator.pop(context, BoxFit.scaleDown);
              },
              child: Text('Scale Down'),
            ),
            SimpleDialogOption(
              onPressed: () {
                Navigator.pop(context, BoxFit.none);
              },
              child: Text('None'),
            ),
          ],
        );
      }
    );
    if(boxFit != null){
      setState(() {
        _boxFit = boxFit;
      });
    }
  }

  @override 
  Widget build(BuildContext context){
    List<Widget> kittenTiles = [];
    for(int i = 200; i < 1000; i+=100){
      String imageUrl = 'http://placekitten.com/200/$i';
      kittenTiles.add(GridTile(child: Image.network(imageUrl, fit: _boxFit)));
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('$widget.title: $_boxFit'),
      ),
      body: OrientationBuilder(
        builder: (context, orientation){
          return GridView.count(
            crossAxisCount: (orientation == Orientation.portrait) ? 2 : 3,
            childAspectRatio: 1.0,
            mainAxisSpacing: 1.0,
            crossAxisSpacing: 1.0,
            children: kittenTiles,
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showBoxFitDialog,
        child: Icon(Icons.select_all),
      ),
    );
  }
}


