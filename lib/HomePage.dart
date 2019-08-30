import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_module/CustomizeWidget.dart';

class CreateHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    print('CreateHomePage build');
    return new HomePageStateless();
  }
}

class HomePageStateless extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    print('HomePageStateless build');
    return new Scaffold(
      appBar: buildAppBar(),
      body: new HomeBody(),
    );
  }

  Widget buildAppBar() {
    return new TitleWidget(
      "Home",
      background: new BoxDecoration(color: Colors.blue),
    );
  }
}

class HomeBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    print('HomeBody build');
    return new ParentWidgetC();
  }
}


class ParentWidgetC extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new _ParentWidgetCState();
  }

}

class _ParentWidgetCState extends State<ParentWidgetC>{
  bool _active = false;
  void _handleTapboxChanged(bool newValue){
    setState(() {
      _active = newValue;
    });
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Container(
      child: new TapboxC(
        active: _active,
        onChanged: _handleTapboxChanged,
      ),
    );
  }

}

class TapboxC extends StatefulWidget {
  final bool active;
  final ValueChanged<bool> onChanged;

  const TapboxC({Key key, this.active, this.onChanged}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new _TapboxCState();
  }

}

class _TapboxCState extends State<TapboxC>{
  bool _highlight = false;

  void _handleTapDown(TapDownDetails details){
    setState(() {
      _highlight = true;
    });
  }
  void _handleTapUp(TapUpDetails details){
    setState(() {
      _highlight = false;
    });
  }
  void _handleTapCancel(){
    setState(() {
      _highlight = false;
    });
  }
  void _handleTap(){
    widget.onChanged(!widget.active);
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new GestureDetector(
      onTap: _handleTap,
      onTapDown: _handleTapDown,
      onTapUp: _handleTapUp,
      onTapCancel: _handleTapCancel,
      child: new Container(
        child: new Center(
          child: new Text(
            widget.active?'Active':'Inactive',
            style: new TextStyle(fontSize: 32.0,color: Colors.white),
          ),
        ),
        height: 200.0,
        width: 200.0,
        decoration: new BoxDecoration(
          color: widget.active?Colors.lightGreen[700]:Colors.grey[600],
          border: _highlight?new Border.all(
            color: Colors.teal[700],
            width: 10.0
          )
              :null,
        ),
      ),
    );
  }

}



// 父Widget管理子Widget的状态
class ParentWidget extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new _ParentWidgetState();
  }
}

class _ParentWidgetState extends State<ParentWidget>{
  bool _active = false;
  void _handleTapboxChanged(bool newValue){
    setState(() {
      _active = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Container(
      child: new TapboxB(
        active: _active,
        onChanged: _handleTapboxChanged,
      ),
    );
  }

}

class TapboxB extends StatelessWidget{
  final bool active;
  final ValueChanged<bool> onChanged;

  const TapboxB({Key key, this.active, this.onChanged}) : super(key: key);

  void _handleTap(){
    onChanged(!active);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new GestureDetector(
      onTap: _handleTap,
      child: new Container(
        child: new Center(
          child: new Text(
            active?'Active':'Inactive',
            style: new TextStyle(fontSize: 32.0,color: Colors.white),
          ),
        ),
        width: 200.0,
        height: 200.0,
        decoration: new BoxDecoration(
          color: active?Colors.lightGreen[700]:Colors.grey[600],
        ),
      ),
    );
  }

}



// Widget管理自身状态
class TapboxA extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new _TapboxAState();
  }

}

class _TapboxAState extends State<TapboxA>{
  bool _active = false;

  void _handleTap(){
     setState(() {
       _active = !_active;
     });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new GestureDetector(
      onTap: _handleTap,
      child: new Container(
        child: new Center(
          child: new Text(
            _active?'Active':'Inactive',
            style: new TextStyle(fontSize: 32.0,color: Colors.white),
          ),
        ),
        width: double.infinity,
        height: 200.0,
        decoration: new BoxDecoration(
          color: _active ? Colors.lightGreen[700]:Colors.grey[600]
        ),
      ),
    );
  }

}

// Lift
class CounterWidget extends StatefulWidget {
  const CounterWidget({Key key, this.initValue: 0});

  final int initValue;

  @override
  _CounterWidgetState createState() => new _CounterWidgetState();
}

class _CounterWidgetState extends State<CounterWidget> {
  int _counter;

  @override
  void initState() {
    super.initState();
    //初始化状态
    _counter = widget.initValue;
    print("initState");
  }

  @override
  Widget build(BuildContext context) {
    print("build");
    return Scaffold(
      body: Center(
        child: FlatButton(
          child: Text('$_counter'),
          //点击后计数器自增
          onPressed: () => setState(
            () => ++_counter,
          ),
        ),
      ),
    );
  }

  @override
  void didUpdateWidget(CounterWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    print("didUpdateWidget");
  }

  @override
  void deactivate() {
    super.deactivate();
    print("deactive");
  }

  @override
  void dispose() {
    super.dispose();
    print("dispose");
  }

  @override
  void reassemble() {
    super.reassemble();
    print("reassemble");
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print("didChangeDependencies");
  }
}


// Error
class ErrorBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    try {
      initError();
    }
    /*on FormatException{
      print('I do it');
    }*/
    catch (e, s) {
      print('Exception details:\n $e');
      print('Stack trace:\n $s');
    }
    return new Center(
      child: new Text('123456789'),
    );
  }

  void initError() {
    throw new FormatException("Test");
  }
}


// Img
class ImgBody extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new ImgBodyState();
  }
}

class ImgBodyState extends State<ImgBody> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new ListView(
      children: <Widget>[
        new Image.network(
            "https://flutter.io/images/homepage/header-illustration.png"),
        new Image.network(
            "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1567142191196&di=ffd1d27062cd06659770e7b22809897a&imgtype=0&src=http%3A%2F%2Fphotocdn.sohu.com%2F20120125%2FImg332960948.jpg"),
        new Image.network(
            "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1567736911&di=5a3c6f96b4f05d8f4652c31e40afff16&imgtype=jpg&er=1&src=http%3A%2F%2Fi6.265g.com%2Fimages%2F201509%2F201509101201012458.jpg"),
        new Image.asset('assets/2_8.png'),
        new Image.asset('assets/2_10.png'),
        new Image.network(
            "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1567142191196&di=9611890a8ac3a4529bc38708c0acb2a5&imgtype=0&src=http%3A%2F%2Fimg2.kfcdn.com%2Fisy%2Fupload%2Fbooklet%2F20140305%2Fbf7kgb1nk28r5vmj_watermark.jpg"),
        new Image.asset('assets/2_11.png'),
        new Image(
            image: new NetworkImage(
                "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1567142191196&di=85a3415f9930390cb00255e40c1f96d9&imgtype=0&src=http%3A%2F%2Fimg.eeyy.com%2Fuploadfile%2F2015%2F0610%2F20150610102416214.jpg")),
      ],
    );
  }
}


// 计数
class CountBody extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    print('CountBody createState');
    return new CountBodyState();
  }
}

class CountBodyState extends State<CountBody> {
  int _count = 0;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    print('CountBodyState build count $_count');
    return new Stack(
      fit: StackFit.expand,
      children: <Widget>[
        Stack(
          alignment: Alignment.center,
          children: <Widget>[
            new Text("$_count"),
          ],
        ),
        Positioned(
          bottom: 12,
          right: 12,
          child: new GestureDetector(
            child: new Padding(
              padding: EdgeInsets.all(10),
              child: new Icon(Icons.add),
            ),
            onTap: _incrementCounter,
          ),
        )
      ],
    );
  }

  void _incrementCounter() {
    setState(() {
      _count++;
    });
  }
}
