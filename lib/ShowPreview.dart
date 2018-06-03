import 'package:flutter/material.dart';
import 'Show.dart';

class ShowPreview extends StatefulWidget {
  ShowPreview({Key key, this.data}) : super(key: key);

  final ShowData data;

  @override
  _ShowPreviewState createState() => new _ShowPreviewState();
}

class _ShowPreviewState extends State<ShowPreview> {
  String slug, title, tagLine, description, link, pic;

  @override
  void initState() {
    super.initState();
    slug = widget.data.slug;
    title = widget.data.title;
    tagLine = widget.data.tagLine;
    description = widget.data.description;
    link = widget.data.link;
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            new MaterialPageRoute(
                builder: (context) => new Show(data: widget.data)),
          );
        },
        child: new Card(
          child: new Center(child: new Text(title)),
        ),
      ),
    );
  }
}
