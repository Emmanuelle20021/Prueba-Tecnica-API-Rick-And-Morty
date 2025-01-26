import 'package:prueba_tecnica_flutter_senior/data/data_source/location_data_source.dart';
import 'package:prueba_tecnica_flutter_senior/domain/entities/location_entity.dart';
import 'package:prueba_tecnica_flutter_senior/domain/repositories/location_reposity.dart';

class LocationRepositoryImplement implements LocationReposity {
  final LocationDataSource locationDataSource;

  LocationRepositoryImplement(this.locationDataSource);

  @override
  Future<LocationEntity> getLocation(int id) async {
    return (await locationDataSource.getLocation(id)).toEntity();
  }

  @override
  Stream<List<LocationEntity>> getLocations() async* {
    await for (var locationsModels in locationDataSource.getLocations()) {
      final locationEntities =
          locationsModels.map((model) => model.toEntity()).toList();
      yield locationEntities;
    }
  }
}
