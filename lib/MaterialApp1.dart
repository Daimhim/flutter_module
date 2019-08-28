import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MyMaterialApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(
      theme: new ThemeData(primaryColor: const Color(0xff63ca6c)),
      home: new PageOne(),
    );
  }
}

class PageOne extends StatelessWidget{
  void findIndex(int index){
    switch(index){
      case 0:

        break;
      case 1:
//        Navigator.pop(context,
//            new MaterialPageRoute(builder: (BuildContext context) {
//              return null;
//            }));
        break;
      case 2:
        break;
    }
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(
          "Wellcome MyMaterialApp",
          style: new TextStyle(color: Colors.white),
        ),
        iconTheme: new IconThemeData(color: Colors.white),
      ),
      body: new Center(
        child: new Text("Start"),
      ),
      bottomNavigationBar: new CupertinoTabBar(
        items: <BottomNavigationBarItem>[
          new BottomNavigationBarItem(
              title: new Text("0"),
              icon: new Image.network(
                  "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1566901171574&di=3bd448195398460035fab3187e52cd62&imgtype=0&src=http%3A%2F%2F5b0988e595225.cdn.sohucs.com%2Fimages%2F20181014%2Fcb69470e99bb42908520aee3a1842b07.jpeg")
          ),
          new BottomNavigationBarItem(
              title: new Text("1"),
              icon: new Image.network(
                  "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1566901171574&di=3bd448195398460035fab3187e52cd62&imgtype=0&src=http%3A%2F%2F5b0988e595225.cdn.sohucs.com%2Fimages%2F20181014%2Fcb69470e99bb42908520aee3a1842b07.jpeg")
          ),
          new BottomNavigationBarItem(
              title: new Text("2"),
              icon: new Image.network(
                  "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1566901171574&di=3bd448195398460035fab3187e52cd62&imgtype=0&src=http%3A%2F%2F5b0988e595225.cdn.sohucs.com%2Fimages%2F20181014%2Fcb69470e99bb42908520aee3a1842b07.jpeg")
          )
        ],
        currentIndex: 0,
//        onTap: findIndex(index),
      ),
    );
  }
}
