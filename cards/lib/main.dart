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
      home: NewsfeedWidget(title: 'News Feed'),
    );
  }
}

class News{
  DateTime _dt;
  String _title;
  String _text;

  News(this._dt, this._title, this._text);
}

class NewsCard extends StatelessWidget{
  News _news;

  NewsCard(this._news);

  @override 
  Widget build(BuildContext context){
    return Padding(
      padding: EdgeInsets.only(
        bottom: 20.0,
      ),
      child: Card(
        child: Padding(
          padding: EdgeInsets.all(20.0), 
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Image.network('https://www.bbc.co.uk/news/special/2015/newsspec_10857/bbc_news_logo.png?cb=1'),
              Padding(
                padding: EdgeInsets.only(
                  top: 20.0,
                  bottom: 10.0,
                ),
                child: Text(
                  '${_news._dt.month}//${_news._dt.day}//${_news._dt.year}',
                  style: TextStyle(
                    fontSize: 10.0,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  bottom: 10.0
                ),
                child: Text(
                  '${_news._text}',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold
                  ),
                ),
              ),
              Text(
                '${_news._text}',
                maxLines: 2,
                style: TextStyle(
                  fontSize: 14.0
                ),
                overflow: TextOverflow.fade,
              ),
              
              Row(
                children: [
                  FlatButton(
                    child: Text('Share'),
                    onPressed: () => {},
                  ),

                  FlatButton(
                    child: Text('Bookmark'),
                    onPressed: () => {},
                  ),

                  FlatButton(
                    child: Text('Link'),
                    onPressed: () => {},
                  ),
                ]
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class NewsfeedWidget extends StatelessWidget{
  NewsfeedWidget({Key key, this.title}) : super(key: key);

  final String title;

  List<News> _newList = [
    News(
      DateTime(2018, 12, 1),
      'Mass shooting in atlanta',
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.'
    ),

    News(
      DateTime(2019, 1, 12),
      'Carnival clown found drunk in mississipi',
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.'
    ),

    News(
      DateTime(2019, 2, 12),
      'Walrus found in family pool in Florida',
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.'
    ),
  ];

  @override
  Widget build(BuildContext context){
    List<Widget> newsCards = _newList.map((news) => NewsCard(news)).toList();
    
    return Scaffold(
      appBar: AppBar(
        title: Text('News Feed'),
      ),
      body: ListView(
        padding: EdgeInsets.all(20.0),
        children: newsCards,
      ),
    );
  }
}

