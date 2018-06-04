import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'Show.g.dart';

@JsonSerializable()
class ShowData extends Object with _$ShowDataSerializerMixin {
  ShowData(this.slug, this.title, this.tagLine, this.description, this.link,
      this.pic);

  String slug, title, description, link, pic;
  @JsonKey(name: "tag_line")
  String tagLine;

  factory ShowData.fromJson(Map<String, dynamic> json) =>
      _$ShowDataFromJson(json);
}

class Show extends StatefulWidget {
  Show({Key key, this.data}) : super(key: key);

  final ShowData data;

  @override
  _ShowState createState() => new _ShowState();
}

class _ShowState extends State<Show> {
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

  List<Widget> buildList() {
    List<String> data = [slug, title, tagLine, description, link];
    List<Widget> resultList = [];
    data.forEach((item) {
      if (item != null) {
        resultList.add(new Container(
          margin: const EdgeInsets.only(top: 10.0, bottom: 10.0),
          child: new Text(item),
        ));
      }
    });
    if (pic == null) {
      resultList.add(new Container(
        margin: const EdgeInsets.only(top: 10.0, bottom: 10.0),
        child: new Image.asset('assets/freshair_default_show_pic.png'),
        ));
    }
    else{
      resultList.add(new Container(
        margin: const EdgeInsets.only(top: 10.0, bottom: 10.0),
        child: new Image.network(pic),
        ));
    }
    return resultList;
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Column(
          children: buildList(), mainAxisAlignment: MainAxisAlignment.center),
    );
  }
}
