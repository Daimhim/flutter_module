import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_module/CustomizeWidget.dart';

class CreateHomePage extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new HomePageStateless();
  }


}


class HomePageStateless extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new HomePageState();
  }


}

class HomePageState extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new HomePage();
  }
}

class HomePage extends State<HomePageState>{

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: buildAppBar(),
      body: buildBody(),
    );
  }
  Widget buildBody(){
    return new Text("I am Body");
  }
  Widget buildAppBar(){
    return new TitleWidget("Home",
      background: new BoxDecoration(
        color: Colors.blue
      ),
    );
  }
}
