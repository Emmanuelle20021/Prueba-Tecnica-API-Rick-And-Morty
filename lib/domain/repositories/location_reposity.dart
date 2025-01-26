import 'package:prueba_tecnica_flutter_senior/domain/entities/location_entity.dart';

abstract class LocationReposity {
  Stream<List<LocationEntity>> getLocations();
  Future<LocationEntity> getLocation(int id);
}
