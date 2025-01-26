import 'package:json_annotation/json_annotation.dart';
import 'package:prueba_tecnica_flutter_senior/domain/entities/location_entity.dart';

part 'location_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class LocationModel {
  final int id;
  final String name;
  final String type;
  final String dimension;
  final List<String> residents;
  final String url;
  final String created;

  LocationModel({
    required this.id,
    required this.name,
    required this.type,
    required this.dimension,
    required this.residents,
    required this.url,
    required this.created,
  });

  factory LocationModel.fromJson(Map<String, dynamic> json) =>
      _$LocationModelFromJson(json);

  Map<String, dynamic> toJson() => _$LocationModelToJson(this);

  static List<LocationModel> fromJsonList(List<Map<String, dynamic>> list) {
    return list.map((item) => LocationModel.fromJson(item)).toList();
  }

  LocationEntity toEntity() => LocationEntity(
        name: name,
        type: type,
        dimension: dimension,
        residents: residents,
      );
}
