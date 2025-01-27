// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'character_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CharacterModel _$CharacterModelFromJson(Map<String, dynamic> json) =>
    CharacterModel(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      status: json['status'] as String,
      species: json['species'] as String,
      type: json['type'] as String,
      gender: json['gender'] as String,
      origin: OriginCharacterModel.fromJson(json['origin']),
      location: LocationCharacterModel.fromJson(json['location']),
      image: json['image'] as String,
      episode:
          (json['episode'] as List<dynamic>).map((e) => e as String).toList(),
      url: json['url'] as String,
      created: json['created'] as String,
    );

Map<String, dynamic> _$CharacterModelToJson(CharacterModel instance) =>
    <String, dynamic>{
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
    };

LocationCharacterModel _$LocationCharacterModelFromJson(
        Map<String, dynamic> json) =>
    LocationCharacterModel(
      name: json['name'] as String,
      url: json['url'] as String,
    );

Map<String, dynamic> _$LocationCharacterModelToJson(
        LocationCharacterModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'url': instance.url,
    };

OriginCharacterModel _$OriginCharacterModelFromJson(
        Map<String, dynamic> json) =>
    OriginCharacterModel(
      name: json['name'] as String,
      url: json['url'] as String,
    );

Map<String, dynamic> _$OriginCharacterModelToJson(
        OriginCharacterModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'url': instance.url,
    };
