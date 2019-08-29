import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'dart:ui';

main() => runApp(new TitleWidget("Home"));

final double kToolbarHeight = MediaQueryData.fromWindow(window).padding.top;

class TitleWidget extends StatelessWidget implements PreferredSizeWidget {
  final GestureTapCallback onBackTap;
  final String data;
  final double height;
  final IconData icon;
  final Decoration background;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return buildTitleBase(buildTitleContent());
  }

  TitleWidget(
    this.data, {
    this.onBackTap,
    this.icon,
    this.background,
    this.height = 48,
  });

  @override
  Size get preferredSize {
    return new Size.fromHeight(height);
  }

  Widget buildTitleBase(Widget widget) {
    return new SafeArea(
        top: true,
        child: new Container(
          width: double.infinity,
          decoration: this.background,
          height: height,
          child: widget,
        ));
  }

  Widget buildTitleContent() {
    List<Widget> list = <Widget>[];
    if (icon != null) {
      list.add(new Align(
        child: new Padding(
          padding: EdgeInsets.only(left: 12),
          child: buildBack(),
        ),
        alignment: Alignment.centerLeft,
      ));
    }
    list.add(new Align(
      child: new Text(this.data),
      alignment: Alignment.center,
    ));
    return new Stack(
      alignment: AlignmentDirectional.center,
      children: list,
    );
  }

  Widget buildBack() {
    if (this.onBackTap == null) {
      return new Icon(Icons.arrow_back);
    } else {
      return new GestureDetector(
        onTap: this.onBackTap,
        child: new Icon(this.icon),
      );
    }
  }
}
