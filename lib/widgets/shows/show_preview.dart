import 'package:flutter/material.dart';
import 'package:fresh_air/widgets/shows/show_overview.dart';
import 'package:json_annotation/json_annotation.dart';

part 'package:fresh_air/widgets/shows/show_preview.g.dart';

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

class ShowPreview extends StatelessWidget {
  ShowPreview({Key key, this.data})
      : slug = data.slug,
        title = data.title,
        tagLine = data.tagLine,
        description = data.description,
        link = data.link,
        pic = data.pic,
        super(key: key);

  final ShowData data;
  final String slug, title, tagLine, description, link, pic;

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
                builder: (context) => new ShowOverview(data: data)),
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
