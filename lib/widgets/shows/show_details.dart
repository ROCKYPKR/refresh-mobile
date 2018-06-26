import 'package:flutter/material.dart';
import 'package:fresh_air/widgets/shows/show_preview.dart';

class ShowDetails extends StatelessWidget {
  ShowDetails({Key key, ShowData data})
      : slug = data.slug,
        title = data.title,
        tagLine = data.tagLine,
        description = data.description,
        link = data.link,
        pic = data.pic,
        super(key: key);

  final String slug, title, tagLine, description, link, pic;

  List<Widget> buildList() {
    List<String> data = [slug, title, tagLine, description, link];
    List<Widget> resultList = [];
    resultList.add(buildImage());
    data.forEach((item) {
      if (item != null) {
        resultList.add(new Container(
          margin: const EdgeInsets.only(top: 10.0, bottom: 10.0),
          child: new Text(
            item,
            textAlign: TextAlign.center,
          ),
        ));
      }
    });
    return resultList;
  }

  Widget buildImage() {
    if (pic == null) {
      return new Container(
        margin: const EdgeInsets.only(top: 10.0, bottom: 10.0),
        child: new Image.asset('assets/freshair_default_show_pic.png'),
      );
    } else {
      return new Container(
        margin: const EdgeInsets.only(top: 10.0, bottom: 10.0),
        child: new Image.network(pic),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return new Hero(
      tag: slug,
      child: new Scaffold(
        body: new SingleChildScrollView(
          child: new ConstrainedBox(
            constraints: new BoxConstraints(minHeight: height, minWidth: width),
            child: new Card(
              elevation: 20.0,
              child: Column(
                children: buildList(),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
