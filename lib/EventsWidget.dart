import 'package:flutter/material.dart';

class EventsWidget extends StatefulWidget {
  EventsWidget({Key key}) : super(key : key);

  @override
  _EventsState createState() => new _EventsState();
}

class _EventsState extends State<EventsWidget> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Text("Events"),
    );
  }
}