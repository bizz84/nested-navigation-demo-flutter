

import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  DetailPage({this.color, this.title});
  final Color color;
  final String title;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: color,
        title: Text(
          title,
        ),
      ),
      body: Container(
        color: color, // Theme.of(context).primaryColor
      ),
    );
  }
}
