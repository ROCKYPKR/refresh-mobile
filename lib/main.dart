import 'package:flutter/material.dart';
import 'StartPage.dart';

void main() => runApp(new FreshAir());

class FreshAir extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new StartPage(title: 'Flutter Demo Home Page'),
    );
  }
}