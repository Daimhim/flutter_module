import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';

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
    return new HomePage();
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
    return null;
  }
  Widget buildAppBar(){
    return new Container(
      child: new Center(
        child: new Text("Home"),
      ),
    );
  }
}
