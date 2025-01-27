import 'package:json_annotation/json_annotation.dart';
import 'package:prueba_tecnica_flutter_senior/domain/entities/character_entity.dart';

part 'character_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class CharacterModel {
  final int id;
  final String name;
  final String status;
  final String species;
  final String type;
  final String gender;
  final OriginCharacterModel origin;
  final LocationCharacterModel location;
  final String image;
  final List<String> episode;
  final String url;
  final String created;

  CharacterModel({
    required this.id,
    required this.name,
    required this.status,
    required this.species,
    required this.type,
    required this.gender,
    required this.origin,
    required this.location,
    required this.image,
    required this.episode,
    required this.url,
    required this.created,
  });

  factory CharacterModel.fromJson(json) => _$CharacterModelFromJson(json);

  toJson() => _$CharacterModelToJson(this);

  static List<CharacterModel> fromJsonList(list) {
    return list.map((item) => CharacterModel.fromJson(item)).toList();
  }

  CharacterEntity toEntity() => CharacterEntity(
        name: name,
        status: status,
        species: species,
        type: type,
        episodes: episode,
        gender: gender,
        origin: origin.name,
        location: location.name,
        image: image,
      );
}

@JsonSerializable(fieldRename: FieldRename.snake)
class LocationCharacterModel {
  final String name;
  final String url;

  LocationCharacterModel({
    required this.name,
    required this.url,
  });

  factory LocationCharacterModel.fromJson(json) =>
      _$LocationCharacterModelFromJson(json);

  toJson() => _$LocationCharacterModelToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class OriginCharacterModel {
  final String name;
  final String url;

  OriginCharacterModel({
    required this.name,
    required this.url,
  });

  factory OriginCharacterModel.fromJson(json) =>
      _$OriginCharacterModelFromJson(json);

  toJson() => _$OriginCharacterModelToJson(this);
}
