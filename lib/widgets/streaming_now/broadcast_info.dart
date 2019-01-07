import 'dart:async';

import 'package:fresh_air/helpers/website_api.dart';
import 'package:fresh_air/widgets/shows/show_preview.dart';
import 'package:json_annotation/json_annotation.dart';

part 'package:fresh_air/widgets/streaming_now/broadcast_info.g.dart';

@JsonSerializable()
class BroadcastInfo extends Object with _$BroadcastInfoSerializerMixin {
  BroadcastInfo(this.title, this.status, this.pic, this.slug, this.link);

  String title, status, pic, slug, link;

  factory BroadcastInfo.fromJson(Map<String, dynamic> json) =>
      _$BroadcastInfoFromJson(json);

  Future<ShowData> toShowData() async => await WebsiteAPI.getShowBySlug(slug);
}