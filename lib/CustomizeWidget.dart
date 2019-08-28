import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

main()=>runApp(new TitleWidget());


class TitleWidget extends StatelessWidget {
  final GestureTapCallback onTap;
  final String data;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return new Stack(

      children: <Widget>[
        new Text("1"),
        new Text("2"),
      ],
    );
  }

  const TitleWidget(this.data, {
    this.onTap
  });


  Widget buildTitle() {
    return new Text()
  }
}

class TitleBackWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return null;
  }
}

class _TitleBackWidget extends State<TitleBackWidget> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Icon(Icons.arrow_back);
  }
}