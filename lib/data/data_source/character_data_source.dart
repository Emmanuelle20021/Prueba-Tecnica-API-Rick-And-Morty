import 'package:dio/dio.dart';
import 'package:prueba_tecnica_flutter_senior/data/models/character_model.dart';
import 'package:prueba_tecnica_flutter_senior/data/utils/dio_client.dart';

class CharacterDataSource {
  final DioClient dioClient;

  CharacterDataSource(this.dioClient);

  // URL base de la API
  final String _baseUrl = 'https://rickandmortyapi.com/api';

  // Obtener todos los personajes
  Stream<List<CharacterModel>> getCharactersStream() async* {
    try {
      final response = await dioClient.dio.get('$_baseUrl/character');
      final results = response.data['results'] as List;
      final List<CharacterModel> characters =
          results.map((json) => CharacterModel.fromJson(json)).toList();
      yield characters;
    } on DioException {
      rethrow;
    }
  }

  // Obtener un solo personaje
  Future<CharacterModel> getCharacter(int id) async {
    try {
      final response = await dioClient.dio.get('$_baseUrl/character/$id');
      final character = CharacterModel.fromJson(response.data);
      return character;
    } catch (e) {
      return CharacterModel(
        id: -1,
        name: 'none',
        status: 'none',
        species: 'none',
        type: 'none',
        gender: 'none',
        origin: OriginCharacterModel(name: 'none', url: 'none'),
        location: LocationCharacterModel(name: 'none', url: 'none'),
        image: 'none',
        episode: [],
        created: 'none',
        url: 'none',
      ); // Retorna un personaje ficticio en caso de error
    }
  }

  // Filtrar por episodio
  Stream<List<CharacterModel>> getCharactersByEpisodeStream(
      String episode) async* {
    try {
      final response = await dioClient.dio.get('$_baseUrl/episode/$episode');
      final List<CharacterModel> characters = (response.data['results'] as List)
          .map((json) => CharacterModel.fromJson(json))
          .toList();
      yield characters;
    } catch (e) {
      yield [];
    }
  }
}
