// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'results.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Results _$ResultsFromJson(Map<String, dynamic> json) => _Results(
  id: (json['id'] as num?)?.toInt(),
  name: json['name'] as String?,
  status: json['status'] as String?,
  species: json['species'] as String?,
  type: json['type'] as String?,
  gender: json['gender'] as String?,
  origin: json['origin'] == null
      ? null
      : Origin.fromJson(json['origin'] as Map<String, dynamic>),
  location: json['location'] == null
      ? null
      : Location.fromJson(json['location'] as Map<String, dynamic>),
  image: json['image'] as String?,
  episode: (json['episode'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  url: json['url'] as String?,
  created: json['created'] as String?,
  isFavorite: json['isFavorite'] as bool? ?? false,
);

Map<String, dynamic> _$ResultsToJson(_Results instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'status': instance.status,
  'species': instance.species,
  'type': instance.type,
  'gender': instance.gender,
  'origin': instance.origin,
  'location': instance.location,
  'image': instance.image,
  'episode': instance.episode,
  'url': instance.url,
  'created': instance.created,
  'isFavorite': instance.isFavorite,
};
