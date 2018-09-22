import 'package:flutter/material.dart';
import 'package:fresh_air/helpers/date_time_formatter.dart';
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
        start = DateTimeFormatter.parse(data.start),
        end = DateTimeFormatter.parse(data.end),
        location = data.location,
        description = data.description,
        super(key: key);

  final String name, location, description;
  final DateTime start, end;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(name),
          Text(
            "$location, $start - $end",
            style: TextStyle(fontSize: 14.0),
          )
        ],
      ),
      subtitle: Text(
        description,
        overflow: TextOverflow.fade,
        maxLines: 3,
      ),
      isThreeLine: true,
      trailing: Icon(Icons.play_arrow),
    );
  }
}
