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

  static ShowData defaultShow() => ShowData("", "FreshSounds", "", "The best music from Freshair.org.uk", "", null);
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
      return Container(
        margin: const EdgeInsets.all(5.0),
        child: Image.asset('assets/freshair_default_show_pic_grey.png'),
      );
    } else {
      return Container(
        margin: const EdgeInsets.all(5.0),
        child: Image.network(pic),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    //timeDilation = 5.0;
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ShowOverview(data: data)),
        );
      },
      child: Hero(
        tag: slug,
        child: Card(
          child: Column(
            children: <Widget>[
              buildImage(),
              Center(child: Text(title, textAlign: TextAlign.center)),
            ],
          ),
        ),
      ),
    );
  }
}
