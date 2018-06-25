import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'package:fresh_air/widgets/events/event_preview.g.dart';

@JsonSerializable()
class EventData extends Object with _$EventDataSerializerMixin {
  EventData(this.name, this.start, this.end, this.location, this.description);

  String name, start, end, location, description;

  factory EventData.fromJson(Map<String, dynamic> json) =>
      _$EventDataFromJson(json);
}

class EventPreview extends StatelessWidget {
  EventPreview({Key key, EventData data})
      : name = data.name,
        start = data.start,
        end = data.end,
        location = data.location,
        description = data.description,
        super(key: key);

  final String name, start, end, location, description;

  @override
  Widget build(BuildContext context) {
    return new ListTile(
      title: new Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          new Text(name),
          new Text(
            "$location, $start - $end",
            style: new TextStyle(fontSize: 14.0),
          )
        ],
      ),
      subtitle: new Text(
        description,
        overflow: TextOverflow.fade,
        maxLines: 3,
      ),
      isThreeLine: true,
      trailing: new Icon(Icons.play_arrow),
    );
  }
}
