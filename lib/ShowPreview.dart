import 'package:flutter/material.dart';
import 'Show.dart';

class ShowPreview extends StatefulWidget {
  ShowPreview({Key key,  ShowData data}) :
        title = data.title,
        super(key : key);

  final String title;

  @override
  _ShowPreviewState createState() => new _ShowPreviewState();
}

class _ShowPreviewState extends State<ShowPreview> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Center(
        child: new Text(widget.title),
      ),
    );
  }
}