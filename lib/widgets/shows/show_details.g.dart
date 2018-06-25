// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'show_details.dart';

// **************************************************************************
// Generator: JsonSerializableGenerator
// **************************************************************************

ShowData _$ShowDataFromJson(Map<String, dynamic> json) => new ShowData(
    json['slug'] as String,
    json['title'] as String,
    json['tag_line'] as String,
    json['description'] as String,
    json['link'] as String,
    json['pic'] as String);

abstract class _$ShowDataSerializerMixin {
  String get slug;
  String get title;
  String get description;
  String get link;
  String get pic;
  String get tagLine;
  Map<String, dynamic> toJson() => <String, dynamic>{
        'slug': slug,
        'title': title,
        'description': description,
        'link': link,
        'pic': pic,
        'tag_line': tagLine
      };
}
