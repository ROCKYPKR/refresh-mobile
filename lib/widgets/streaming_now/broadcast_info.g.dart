// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'broadcast_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BroadcastInfo _$BroadcastInfoFromJson(Map<String, dynamic> json) {
  return new BroadcastInfo(json['title'] as String, json['status'] as String,
      json['pic'] as String, json['slug'] as String, json['link'] as String);
}

abstract class _$BroadcastInfoSerializerMixin {
  String get title;
  String get status;
  String get pic;
  String get slug;
  String get link;
  Map<String, dynamic> toJson() => <String, dynamic>{
        'title': title,
        'status': status,
        'pic': pic,
        'slug': slug,
        'link': link
      };
}
