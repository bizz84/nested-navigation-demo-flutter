import 'package:flutter/material.dart';

class MasterPage extends StatelessWidget {
  MasterPage({this.color, this.title, this.onPush});
  final Color color;
  final String title;
  final VoidCallback onPush;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            title,
          ),
          backgroundColor: color,
        ),
        body: Container(
          color: color,
          alignment: Alignment.center,
          child: FlatButton(
            child: Text(
              'PUSH',
              style: TextStyle(fontSize: 32.0, color: Colors.white),
            ),
            onPressed: onPush,
          ),
        ));
  }
}
