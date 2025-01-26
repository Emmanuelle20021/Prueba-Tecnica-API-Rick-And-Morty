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
  final String origin;
  final String location;
  final String image;
  final List<String> episodes;
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
    required this.episodes,
    required this.url,
    required this.created,
  });

  factory CharacterModel.fromJson(Map<String, dynamic> json) =>
      _$CharacterModelFromJson(json);

  toJson() => _$CharacterModelToJson(this);

  static List<CharacterModel> fromJsonList(List<Map<String, dynamic>> list) {
    return list.map((item) => CharacterModel.fromJson(item)).toList();
  }

  CharacterEntity toEntity() => CharacterEntity(
        name: name,
        status: status,
        species: species,
        type: type,
        episodes: episodes,
        gender: gender,
        origin: origin,
        location: location,
        image: image,
      );
}
