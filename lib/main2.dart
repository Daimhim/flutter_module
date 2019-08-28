import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_module/AppHome.dart';
import 'package:flutter_module/MaterialApp1.dart';

void main()=>runApp(new SampleApp());

class SampleApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new CreateAppHome();
  }
}

class SampleAppPage extends StatefulWidget {
  SampleAppPage({Key key}) :super(key:key);


  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new _SampleAppPageState();
  }}

class _SampleAppPageState extends State<SampleAppPage>{
  String textToShow = "I like Flutter";
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Sample App"),
      ),
      body: new Center(child: new Text(textToShow)),
      floatingActionButton: new FloatingActionButton(
          onPressed:_updataText,
        tooltip: 'Updata Text',
        child: new Icon(Icons.update),
      ),
    );
  }

  void _updataText(){
    setState(() {
      textToShow = "Flutter is Awesome!";
    });
  }
}