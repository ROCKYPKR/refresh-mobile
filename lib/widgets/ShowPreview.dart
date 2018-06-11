import 'package:flutter/material.dart';
import 'package:fresh_air/widgets/ShowDetails.dart';
import 'package:fresh_air/widgets/ShowOverview.dart';
//import 'package:flutter/scheduler.dart' show timeDilation;

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
    pic = widget.data.pic;
  }

  Widget buildImage() {
    if (pic == null) {
      return new Container(
        margin: const EdgeInsets.all(5.0),
        child: new Image.asset('assets/freshair_default_show_pic.png'),
      );
    } else {
      return new Container(
        margin: const EdgeInsets.all(5.0),
        child: new Image.network(pic),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    //timeDilation = 5.0;
    return new GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            new MaterialPageRoute(
                builder: (context) => new ShowOverview(data: widget.data)),
          );
        },
        child: new Hero(
          tag: slug,
          child: new Card(
            child: new Column(
              children: <Widget>[
                buildImage(),
                new Center(child: new Text(title, textAlign: TextAlign.center)),
              ],
            ),
          ),
        ));
  }
}
