import 'package:flutter/material.dart';

class ShowsWidget extends StatefulWidget {
  ShowsWidget({Key key}) : super(key : key);

  @override
  _ShowsState createState() => new _ShowsState();
}

class _ShowsState extends State<ShowsWidget> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Text("Shows"),
    );
  }
}