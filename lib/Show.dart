import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
part 'Show.g.dart';

@JsonSerializable()
class ShowData extends Object with  _$ShowDataSerializerMixin{
  ShowData(this.slug, this.title, this.tagLine, this.description, this.link, this.pic);
  String slug,
      title,
      tagLine,
      description,
      link,
      pic;

  factory ShowData.fromJson(Map<String, dynamic> json) => _$ShowDataFromJson(json);
}

class Show extends StatefulWidget {
  Show({Key key, this.data}) : super(key : key);

  final ShowData data;

  @override
  _ShowState createState() => new _ShowState();
}

class _ShowState extends State<Show> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Text("Contact"),
    );
  }
}

