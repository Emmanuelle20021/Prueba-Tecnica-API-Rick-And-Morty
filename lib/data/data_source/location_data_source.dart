import 'package:prueba_tecnica_flutter_senior/data/models/location_model.dart';
import 'package:prueba_tecnica_flutter_senior/data/utils/dio_client.dart';

class LocationDataSource {
  final DioClient dioClient;

  LocationDataSource(this.dioClient);

  final String _baseUrl = 'https://rickandmortyapi.com/api';

  Future<LocationModel> getLocation(int id) async {
    try {
      final response = await dioClient.dio.get('$_baseUrl/location/$id');
      final location = LocationModel.fromJson(response.data);
      return location;
    } catch (e) {
      return LocationModel(
        id: -1,
        name: 'none',
        created: 'none',
        dimension: 'none',
        residents: [],
        type: 'none',
        url: 'none',
      ); // Retorna un episodio ficticio en caso de error
    }
  }

  Stream<List<LocationModel>> getLocations() async* {
    try {
      final response = await dioClient.dio.get('$_baseUrl/character');
      final List<LocationModel> locations = (response.data['results'] as List)
          .map((json) => LocationModel.fromJson(json))
          .toList();
      yield locations;
    } catch (e) {
      yield []; // Retorna una lista vacía en caso de error
    }
  }
}
