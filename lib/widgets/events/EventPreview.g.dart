// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'EventPreview.dart';

// **************************************************************************
// Generator: JsonSerializableGenerator
// **************************************************************************

EventData _$EventDataFromJson(Map<String, dynamic> json) => new EventData(
    json['name'] as String,
    json['start'] as String,
    json['end'] as String,
    json['location'] as String,
    json['description'] as String);

abstract class _$EventDataSerializerMixin {
  String get name;
  String get start;
  String get end;
  String get location;
  String get description;
  Map<String, dynamic> toJson() => <String, dynamic>{
        'name': name,
        'start': start,
        'end': end,
        'location': location,
        'description': description
      };
}
