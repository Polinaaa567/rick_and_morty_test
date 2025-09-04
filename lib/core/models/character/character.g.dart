// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'character.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Character _$CharacterFromJson(Map<String, dynamic> json) => _Character(
  info: json['info'] == null
      ? null
      : Info.fromJson(json['info'] as Map<String, dynamic>),
  results: (json['results'] as List<dynamic>?)
      ?.map((e) => Results.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$CharacterToJson(_Character instance) =>
    <String, dynamic>{'info': instance.info, 'results': instance.results};
