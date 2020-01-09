import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        inputDecorationTheme: InputDecorationTheme(
          border: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.deepPurple),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.green),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.deepPurple),
          ),
          labelStyle: TextStyle(
            color: Colors.blueGrey,
          ),
        ),
      ),
      home: HomeWidget(),
    );
  }
}

class HomeWidget extends StatelessWidget{
  final _formKey = GlobalKey<FormState>();
  final List<TextEditingController> _textEditingControllers = [];
  final List<Widget> _widgets = [];


  TextFormField _createTextFormField(String fieldName, bool enabled, TextEditingController controller){
      return TextFormField(
        enabled: enabled,
        validator: (value){
          if(value.isEmpty){
            return 'Please enter $fieldName';
          }
        },
        decoration: InputDecoration(
          icon: const Icon(Icons.person),
          hintText: fieldName,
          labelText: 'Enter $fieldName',
        ),
        controller: controller,
      );
    }

  HomeWidget({Key key}) : super(key: key){
    List<String> fieldNames = [
      'First Name',
      'Last Name',
      'Address 1',
      'Address 2',
      'City',
      'State',
      'Zip'
    ];
    
    for(int i = 0, ii = fieldNames.length; i < ii; i++){
      String fieldName = fieldNames[i];
      TextEditingController textEditingController = TextEditingController(text: '');
      _textEditingControllers.add(textEditingController);
      _widgets.add(Padding(
        child: _createTextFormField(fieldName, i > 1, textEditingController),
        padding: EdgeInsets.all(10.0),
      ));
      _widgets.add(RaisedButton(
        onPressed: () {
          _formKey.currentState.validate();
        },
        child: Text('Save'),
      ));
    }
  } 

  @override 
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('Input Decoration Themes'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: _widgets,
          ),
        ),
      ),
    );
  }
}
