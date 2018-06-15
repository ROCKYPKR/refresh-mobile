// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Podcast.dart';

// **************************************************************************
// Generator: JsonSerializableGenerator
// **************************************************************************

PodcastData _$PodcastDataFromJson(Map<String, dynamic> json) => new PodcastData(
    json['title'] as String,
    json['description'] as String,
    json['uri'] as String,
    json['broadcast_date'] as String);

abstract class _$PodcastDataSerializerMixin {
  String get title;
  String get description;
  String get uri;
  String get broadcastDate;
  Map<String, dynamic> toJson() => <String, dynamic>{
        'title': title,
        'description': description,
        'uri': uri,
        'broadcast_date': broadcastDate
      };
}
