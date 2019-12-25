import 'package:flutter/material.dart';

void main() => runApp(ListViewListTileApp());

class ListViewListTileApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeWidget(title: 'ListView & ListTile'),
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
  int _selectedIndex = 0;
  static const TEXT_STYLE_NORMAL = const TextStyle(
    color: Colors.black,
    fontSize: 18.0,
    fontWeight: FontWeight.normal,
  );

  static const TEXT_STYLE_SELECTED = const TextStyle(
    color: Colors.black,
    fontSize: 18.0,
    fontWeight: FontWeight.bold,
  );

  final TextFormField _fontSizeTextField = TextFormField(
    decoration: InputDecoration(
      icon: Icon(Icons.format_size),
      hintText: 'Font size',
      labelText: 'Enter font size',
    ),
  );

  final TextFormField _historyTextFormField = TextFormField(
    decoration: InputDecoration(
      icon: Icon(Icons.history),
      hintText: 'Days',
      labelText: 'Enter days',
    ),
  );

  final TextFormField _languageTextFormField = TextFormField(
    decoration: InputDecoration(
      icon: Icon(Icons.language),
      hintText: 'Language',
      labelText: 'Enter your language'
    ),
  );

  select(index){
    setState(() {
      _selectedIndex = index;
    });
  }

  @override 
  Widget build(BuildContext context){
    
    final ListTile accessibilityListTile = ListTile(
      leading: Icon(Icons.accessibility),
      title: Text(
        'Accessibility',
        style: _selectedIndex == 0 ? TEXT_STYLE_SELECTED : TEXT_STYLE_NORMAL,
      ),
      subtitle: Text('Accessibility Settings'),
      trailing: Icon(Icons.settings),
      onTap: () => select(0),
    );

    final ListTile historyListTile = ListTile(
      leading: Icon(Icons.history),
      title: Text(
        'History',
        style: _selectedIndex == 1 ? TEXT_STYLE_SELECTED : TEXT_STYLE_NORMAL,
      ),
      subtitle: Text('History Settings'),
      trailing: Icon(Icons.settings),
      onTap: () => select(1),
    );

    final ListTile languageListTile = ListTile(
      leading: Icon(Icons.language),
      title: Text(
        'Language',
        style: _selectedIndex == 2 ? TEXT_STYLE_SELECTED : TEXT_STYLE_NORMAL,
      ),
      subtitle: Text('Language Settings'),
      trailing: Icon(Icons.settings),
      onTap: () => select(2),
    );

    final seletionTile = (_selectedIndex == 0 ? 'Accessibility' : _selectedIndex == 1 ? 'History' : 'Language') + ' Settings';

    final selectionTextFormField = _selectedIndex == 0 ? _fontSizeTextField : _selectedIndex == 1 ? _historyTextFormField : _languageTextFormField;

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView(
        children: <Widget>[
          accessibilityListTile,
          historyListTile,
          languageListTile,
        ],
      ),
      bottomSheet: Container(
        color: Color(0xFFB3E5FC),
        padding: EdgeInsets.all(20.0),
        child: Container(
          constraints: BoxConstraints(maxHeight: 200.0),
          child: Column(
            children: <Widget>[
              Icon(Icons.settings),
              Text(seletionTile),
              Expanded(child: selectionTextFormField),
            ],
          ),
        ),
      ),
    );
  }
}
