import 'package:flutter/material.dart';

class ColorDetailPage extends StatelessWidget {
  const ColorDetailPage(
      {super.key,
      required this.color,
      required this.title,
      this.materialIndex = 500});
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
        color: color[materialIndex],
      ),
    );
  }
}
