import 'package:flutter/material.dart';

class EventList extends StatefulWidget {
  EventList({Key key}) : super(key : key);

  @override
  _EventListState createState() => new _EventListState();
}

class _EventListState extends State<EventList> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Center(
        child: new Text("Events"),
      ),
    );
  }
}