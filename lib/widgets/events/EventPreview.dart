import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'package:fresh_air/widgets/events/EventPreview.g.dart';

@JsonSerializable()
class EventData extends Object with _$EventDataSerializerMixin {
  EventData(this.name, this.start, this.end, this.location, this.description);

  String name, start, end, location, description;

  factory EventData.fromJson(Map<String, dynamic> json) =>
      _$EventDataFromJson(json);
}

class EventPreview extends StatelessWidget{
  EventPreview({Key key, this.data}) : super(key : key);

  final EventData data;

  @override
  Widget build(BuildContext context) {
    return new Text(data.name);
  }
}