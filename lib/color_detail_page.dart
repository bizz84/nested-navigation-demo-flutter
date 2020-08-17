import 'package:flutter/material.dart';
import 'package:nested_navigation_demo_flutter/global.dart';

class ColorDetailPage extends StatelessWidget {
  ColorDetailPage({this.color, this.title, this.materialIndex: 500});
  final MaterialColor color;
  final String title;
  final int materialIndex;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: color,
        title: Text(
          '$title[$materialIndex]',
        ),
      ),
      body: Container(
        child: Center(
          child: RaisedButton(
              child: Text("Push to another screen"),
              onPressed: () {
                Global.pageNavigatorKey.currentState.pushNamed('/other');
              }),
        ),
        color: color[materialIndex],
      ),
    );
  }
}
