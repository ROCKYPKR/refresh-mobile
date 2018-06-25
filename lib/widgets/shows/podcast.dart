import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:url_launcher/url_launcher.dart';

part 'package:fresh_air/widgets/shows/podcast.g.dart';

@JsonSerializable()
class PodcastData extends Object with _$PodcastDataSerializerMixin {
  PodcastData(this.title, this.description, this.uri, this.broadcastDate);

  String title, description, uri;
  @JsonKey(name: "broadcast_date")
  String broadcastDate;

  factory PodcastData.fromJson(Map<String, dynamic> json) =>
      _$PodcastDataFromJson(json);
}

class Podcast extends StatelessWidget {
  Podcast({Key key, this.data}) : super(key: key);

  final PodcastData data;

  _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return new ListTile(
      title: new Text(data.title),
      trailing: new Icon(Icons.keyboard_arrow_right),
      onTap: () {
        _launchURL(data.uri);
      },
    );
  }
}
