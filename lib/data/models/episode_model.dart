import 'package:json_annotation/json_annotation.dart';
import 'package:prueba_tecnica_flutter_senior/domain/entities/episode_entity.dart';

part 'episode_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class EpisodeModel {
  final int id;
  final String name;
  final String airDate;
  final String episode;
  final List<String> characters;

  EpisodeModel({
    required this.id,
    required this.name,
    required this.airDate,
    required this.episode,
    required this.characters,
  });

  factory EpisodeModel.fromJson(Map<String, dynamic> json) =>
      _$EpisodeModelFromJson(json);

  Map<String, dynamic> toJson() => _$EpisodeModelToJson(this);

  static List<EpisodeModel> fromJsonList(List<Map<String, dynamic>> list) {
    return list.map((item) => EpisodeModel.fromJson(item)).toList();
  }

  EpisodeEntity toEntity() => EpisodeEntity(
        name: name,
        airDate: airDate,
        episode: episode,
        characters: characters,
      );
}
