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

class Tab1 extends StatelessWidget{
  @override 
  Widget build(BuildContext context){
    return Image.network('http://cdn2.thecatapi.com/images/MTY1NDA3OA.jpg');
  }
}

class Tab2 extends StatelessWidget{
  @override 
  Widget build(BuildContext context){
    return Image.network('http://cdn2.thecatapi.com/images/68j.jpg');
  }
}

class Tab3 extends StatelessWidget{
  @override 
  Widget build(BuildContext context){
    return Image.network('http://cdn2.thecatapi.com/images/ece.jpg');
  }
}

class HomeWidget extends StatelessWidget{
  HomeWidget({Key key}) : super(key: key);

  @override 
  Widget build(BuildContext context){
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Cats Tabs'),
          // the code below displays the tabs at the top of the screen
          // bottom: TabBar(
          //   tabs: <Widget>[
          //     Tab(
          //       text: 'Cat #1',
          //       icon: Icon(Icons.keyboard_arrow_left),
          //     ),

          //     Tab(
          //       text: 'Cat #2',
          //       icon: Icon(Icons.keyboard_arrow_up),
          //     ),

          //     Tab(
          //       text: 'Cat #3',
          //       icon: Icon(Icons.keyboard_arrow_right),
          //     ),
          //   ],
          // ),
        ),
        body: TabBarView(
          children: <Widget>[
            Tab1(),
            Tab2(),
            Tab3(),
          ],
        ),
        //this is going to display the tabs at the bottom of the screen, more like iOS tabs but without using Cupertino Widgets
        bottomNavigationBar: Container(
          child: TabBar(
            labelColor: Colors.blue,
            unselectedLabelColor: Colors.grey,
            labelStyle: TextStyle(
              color: Colors.blue,
              fontWeight: FontWeight.w800
            ),
            indicatorColor: Colors.white,
            tabs: <Widget>[
              Tab(
                text: 'Cat #1',
                icon: Icon(Icons.keyboard_arrow_left),
              ),

              Tab(
                text: 'Cat #2',
                icon: Icon(Icons.keyboard_arrow_up),
              ),

              Tab(
                text: 'Cat #3',
                icon: Icon(Icons.keyboard_arrow_right),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

