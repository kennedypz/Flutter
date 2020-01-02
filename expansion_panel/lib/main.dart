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

class ExpansionPanelData{
  String _title;
  String _body;
  bool _expanded;

  ExpansionPanelData(this._title, this._body, this._expanded);

  String get title => _title;

  @override 
  String toString(){
    return 'ExpansionPanelData{_title: $_title, _body: $_body, _expanded: $_expanded}';
  }

  String get body => _body;

  bool get expanded => _expanded;

  set expanded(bool value){
    _expanded = value;
  }
}

class HomeWidget extends StatefulWidget{
  @override 
  _HomeWidgetState createState() => _HomeWidgetState([
    ExpansionPanelData(
      'Can I backup my data?',
      'asdfasdf asdufhasidf asidufhasiudfas dsiaufhsdaas asidufhasdf iausdhf', 
      false
    ),
    ExpansionPanelData(
      'How can I increase my space?', 
      'asdfiausdf asdifuahsdf asdfiasudhf as asiduh asiudhfaisudhf a iasdufhasidfh asihf',
      false
    ),
    ExpansionPanelData(
      'How do I cancel?', 
      'asihdfai iasuhdfiusahdfi iasduhf iasudhfiausdhfiuashdf aisdufhaisdufhaisudhf iauhd', 
      false
    ),
    ExpansionPanelData(
      'How do I change language?', 
      'asidhfas hdifhuifh asd qoweirqowier q qoier qe oirq eroiq qwer hqiwohrfqi', 
      false
    ),
    ExpansionPanelData(
      'How do I search?', 
      'asdhfiuasd hfiasud fqwerwqerqwerqw hiufahsidu hfaisudf qiwufh aisduhfaasdiufha',
      false
    ),
    ExpansionPanelData(
      'How do I view on other devices?', 
      'hahahahahahd aosudihSomeoneHireMePlsfasoidhf oasiudhfoasuihdfaoshdf ', 
      false
    ),
    ExpansionPanelData(
      'How do I view my history', 
      'asidfh iashdf igsfaisfaisf iah iasudfh iasdgf iashgfia shdfiashudfiasuhf iasf i',
      false
    ),
    ExpansionPanelData(
      'Is my subscription cost going to go up?',
      'asdfiahsdifh iasduhf iasudhfisaudhfaisdfiasd iasiudsaifuh isadfhuasiuhf',
      false
    ),
  ]);
}

class _HomeWidgetState extends State<HomeWidget>{
  List<ExpansionPanelData> _expansionPanelData;

  _HomeWidgetState(this._expansionPanelData);

  _onExpansion(int panelIndex, bool isExpanded){
    setState(() {
      _expansionPanelData[panelIndex].expanded = !(_expansionPanelData[panelIndex].expanded);
    });
  }

  @override 
  Widget build(BuildContext context){
    List<ExpansionPanel> expansionPanels = [];
    
    for(int i = 0; i < _expansionPanelData.length; i++){
      var expansionPanelData = _expansionPanelData[i];
      expansionPanels.add(ExpansionPanel(
        headerBuilder: (BuildContext context, bool expanded){
          return Padding(
            padding: EdgeInsets.all(20.0),
            child: Text(
              expansionPanelData.title,
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          );
        },
        body: Padding(
          padding: EdgeInsets.all(20.0),
          child: Text(
            expansionPanelData.body,
            style: TextStyle(
              fontSize: 16.0,
              fontStyle: FontStyle.italic
            ),
          ),
        ),
        isExpanded: expansionPanelData.expanded
      ));
    }
    return Scaffold(
      appBar: AppBar(
        title: Text('FAQs'),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.all(24.0),
          child: ExpansionPanelList(
            children: expansionPanels,
            expansionCallback: _onExpansion,
          ),
        ),
      ),
    );
  }
}

