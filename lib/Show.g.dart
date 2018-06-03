// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Show.dart';

// **************************************************************************
// Generator: JsonSerializableGenerator
// **************************************************************************

ShowData _$ShowDataFromJson(Map<String, dynamic> json) => new ShowData(
    json['slug'] as String,
    json['title'] as String,
    json['tagLine'] as String,
    json['description'] as String,
    json['link'] as String,
    json['pic'] as String);

abstract class _$ShowDataSerializerMixin {
  String get slug;
  String get title;
  String get tagLine;
  String get description;
  String get link;
  String get pic;
  Map<String, dynamic> toJson() => <String, dynamic>{
        'slug': slug,
        'title': title,
        'tagLine': tagLine,
        'description': description,
        'link': link,
        'pic': pic
      };
}
