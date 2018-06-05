import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'package:fresh_air/widgets/Podcast.g.dart';


@JsonSerializable()
class PodcastData extends Object with _$PodcastDataSerializerMixin {
  PodcastData(this.title, this.description, this.uri,
           this.broadcastDate);

  String title, description, uri;
  @JsonKey(name: "broadcast_date")
  String broadcastDate;

  factory PodcastData.fromJson(Map<String, dynamic> json) =>
      _$PodcastDataFromJson(json);
}