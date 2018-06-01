import 'package:flutter/material.dart';

class StreamingNowWidget extends StatefulWidget {
  StreamingNowWidget({Key key}) : super(key : key);

  @override
  _StreamingNowState createState() => new _StreamingNowState();
}

class _StreamingNowState extends State<StreamingNowWidget> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Text("Streaming Now"),
    );
  }
}