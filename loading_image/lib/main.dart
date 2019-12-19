import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Image',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeWidget(),
    );
  }
}

class HomeWidget extends StatelessWidget{
    //HomeWidget({Key: key}) : super(key:key);

    @override 
    Widget build(BuildContext context){
      return Scaffold(
        appBar: AppBar(
          title: Text("Image"),
        ),
        body: Center(
          child: FadeInImage.assetNetwork(
            placeholder: "assets/loading.gif",
            image: "https://i.imgflip.com/2poxx9.jpg",
          ),
        ),
      );
    }
}