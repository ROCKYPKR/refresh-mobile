import 'package:flutter/material.dart';
import 'StartPage.dart';

void main() => runApp(new FreshAir());

class FreshAir extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'FreshAir',
      theme: new ThemeData(
        primarySwatch: Colors.green,
      ),
      home: new StartPage(),
    );
  }
}
