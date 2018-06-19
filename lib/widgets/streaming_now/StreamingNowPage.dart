import 'package:flutter/material.dart';

class StreamingNowPage extends StatefulWidget {
  StreamingNowPage({Key key}) : super(key : key);

  @override
  _StreamingNowPageState createState() => new _StreamingNowPageState();
}

class _StreamingNowPageState extends State<StreamingNowPage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Text("https://studio.freshair.org.uk:8443/radio"),
    );
  }
}