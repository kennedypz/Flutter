import 'package:flutter/material.dart';

void main() => runApp(ModelBinding<ThemeModel>(
  initialModel: ThemeModel(true), child: MyApp()  
));

class ThemeModel{
  ThemeModel(this._dark);

  bool _dark = true;
  bool get dark => _dark;

  @override
  bool operator ==(Object other){
    if(identical(this, other)){
      return true;
    } else if(other.runtimeType != runtimeType){
      return false;
    } else{
      final ThemeModel otherModel = other;
      return dark == otherModel.dark;
    }
  }

  int get hashCode => dark.hashCode;
}

class _ModelBindingScope<T> extends InheritedWidget{
  const _ModelBindingScope({Key key, this.modelBindingState, Widget child}) : super(key: key, child: child);

  final _ModelBindingState<T> modelBindingState;

  @override
  bool updateShouldNotify(_ModelBindingScope oldWidget) => true;
}

class ModelBinding<T> extends StatefulWidget{
  ModelBinding({Key key, @required this.initialModel, this.child}) : assert(initialModel != null), super(key: key);

  final T initialModel;
  final Widget child;
  _ModelBindingState<T> createState() => _ModelBindingState<T>();

  static Type _typeOf<T>() => T;
  
  static T of<T>(BuildContext context){
    final Type scopeType = _typeOf<_ModelBindingScope<T>>();
    final _ModelBindingScope<dynamic> scope = context.dependOnInheritedWidgetOfExactType(scopeType);
    scope.modelBindingState.updateModel(newModel);
  }
}

class _ModelBindingState<T> extends State<ModelBinding<T>>{
  T currentModel;

  @override 
  void initState(){
    super.initState();
    currentModel = widget.initialModel;
  }

  void updateModel(T newModel){
    if(newModel != currentModel){
      setState((){
        currentModel = newModel;
      });
    }
  }

  @override
  Widget build(BuildContext context){
    return _ModelBindingScope<T>(
      modelBindingState: this,
      child: widget.child,
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    ThemeModel model = ModelBinding.of(context);
    return MaterialApp(
      title: "Flutter demo",
      theme: ThemeData(
        primarySwatch: Colors.blue,
        brightness: model.dark ? Brightness.dark : Brightness.light
      ),
      home: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.display1,
            ),
          ],
        ),
      ),
    );
  }
}
