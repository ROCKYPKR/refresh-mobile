import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'package:fresh_air/widgets/ShowDetails.g.dart';

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

class ShowDetails extends StatefulWidget {
  ShowDetails({Key key, this.data}) : super(key: key);

  final ShowData data;

  @override
  _ShowDetailsState createState() => new _ShowDetailsState();
}

class _ShowDetailsState extends State<ShowDetails> {
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
