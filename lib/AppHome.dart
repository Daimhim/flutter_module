import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_module/HomePage.dart';
import 'package:flutter_module/ListPage.dart';
import 'package:flutter_module/MessagePage.dart';

void main() {
  runApp(new CreateAppHome())
  if (Platform.isAndroid) {
    // 以下两行 设置android状态栏为透明的沉浸。写在组件渲染之后，是为了在渲染后进行set赋值，覆盖状态栏，写在渲染之前MaterialApp组件会覆盖掉这个值。
    SystemUiOverlayStyle systemUiOverlayStyle =
    SystemUiOverlayStyle(statusBarColor: Colors.transparent);
    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
  }
}

class CreateAppHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(
      home: new AppHome(),
    );
  }
}

class AppHome extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new CustomizeAppHomeState();
  }
}


/*
 自定义实现首页
 */
class CustomizeAppHomeState extends State<AppHome> {
  int _index = 0;
  List<Widget> _list = new List();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _list..add(new CreateHomePage())..add(new ListPage())..add(
        new MessagePage());
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      body: _list[_index],
      bottomNavigationBar: BottomAppBar(
        color: Colors.lightBlue,
        shape: CircularNotchedRectangle(),
        child: tabs(),
      ),
    );
  }


  Widget getTabItem(int index, String text, IconData icon) {
    return new GestureDetector(
      onTap: () {
        setState(() {
          _index = index;
        });
      },
      child: new Container(
        padding: EdgeInsets.only(top: 5, bottom: 5),
        decoration: new BoxDecoration(
            color: index == 1 ? Colors.black87 : Colors.black26),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
//          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            new Icon(icon),
            new Text(
              text,
            ),
          ],
        ),
      ),
    );
  }

  Row tabs() {
    return new Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Expanded(
          child: getTabItem(0, 'Home', Icons.home),
          flex: 1,
        ),
        Expanded(
          child: getTabItem(1, 'List', Icons.list),
          flex: 1,
        ),
        Expanded(
          child: getTabItem(2, 'message', Icons.message),
          flex: 1,
        ),
      ],
    );
  }
}

/*
 BottomNavigationBar 实现首页
 */
class BNBarAppHomeState extends State<AppHome> {
  int _currentIndex = 0;
  final List<Widget> _children = [CreateHomePage(), ListPage(), MessagePage()];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: onTabapped,
          items: [
            BottomNavigationBarItem(
                title: new Text('Home'), icon: new Icon(Icons.home)),
            BottomNavigationBarItem(
                title: new Text('List'), icon: new Icon(Icons.list)),
            BottomNavigationBarItem(
                title: new Text('message'), icon: new Icon(Icons.message)),
          ]),
    );
  }

  void onTabapped(int value) {
    setState(() {
      _currentIndex = value;
    });
  }
}

/*
 TabBar 实现首页
 */
class TabBarAppHomeState extends State<AppHome>
    with SingleTickerProviderStateMixin {
  TabController controller;

  @override
  void initState() {
    super.initState();
    controller = new TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      bottomNavigationBar: buildBottomBar(),
      body: buildContentView(),
    );
  }

  Widget buildBottomBar() {
    return new Material(
      color: Colors.blue,
      child: new TabBar(
        controller: controller,
        tabs: <Tab>[
          new Tab(text: 'Home', icon: new Icon(Icons.home)),
          new Tab(text: 'List', icon: new Icon(Icons.list)),
          new Tab(text: 'message', icon: new Icon(Icons.message)),
        ],
        indicatorWeight: 0.1,
      ),
    );
  }

  Widget buildContentView() {
    return new TabBarView(
      controller: controller,
      children: <Widget>[
        new CreateHomePage(),
        new ListPage(),
        new MessagePage(),
      ],
    );
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }
}
