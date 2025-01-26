import 'package:dio/dio.dart';
import 'package:prueba_tecnica_flutter_senior/data/models/character_model.dart';

class CharacterDataSource {
  final Dio dio;

  CharacterDataSource(this.dio);

  // URL base de la API
  final String _baseUrl = 'https://rickandmortyapi.com/api';

  // Obtener todos los personajes
  Stream<List<CharacterModel>> getCharactersStream() async* {
    try {
      final response = await dio.get('$_baseUrl/character');
      final List<CharacterModel> characters = (response.data['results'] as List)
          .map((json) => CharacterModel.fromJson(json))
          .toList();
      yield characters;
    } catch (e) {
      yield []; // Retorna una lista vacía en caso de error
    }
  }

  // Obtener un solo personaje
  Future<CharacterModel> getCharacter(int id) async {
    try {
      final response = await dio.get('$_baseUrl/character/$id');
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
        origin: 'none',
        location: 'none',
        image: 'none',
        episodes: [],
        created: 'none',
        url: 'none',
      ); // Retorna un personaje ficticio en caso de error
    }
  }

  // Filtrar por episodio
  Stream<List<CharacterModel>> getCharactersByEpisodeStream(
      String episode) async* {
    try {
      final response = await dio.get('$_baseUrl/episode/$episode');
      final List<CharacterModel> characters = (response.data['results'] as List)
          .map((json) => CharacterModel.fromJson(json))
          .toList();
      yield characters;
    } catch (e) {
      yield [];
    }
  }

  // Filtrar por ubicación
  Stream<List<CharacterModel>> getCharactersByLocationStream(
      String location) async* {
    try {
      final response = await dio.get('$_baseUrl/location/$location');
      final List<CharacterModel> characters = (response.data['results'] as List)
          .map((json) => CharacterModel.fromJson(json))
          .toList();
      yield characters;
    } catch (e) {
      yield [];
    }
  }

  // Filtrar por estado
  Stream<List<CharacterModel>> getCharactersByStatusStream(
      String status) async* {
    try {
      final response = await dio
          .get('$_baseUrl/character', queryParameters: {'status': status});
      final List<CharacterModel> characters = (response.data['results'] as List)
          .map((json) => CharacterModel.fromJson(json))
          .toList();
      yield characters;
    } catch (e) {
      yield [];
    }
  }

  // Filtrar por especie
  Stream<List<CharacterModel>> getCharactersBySpeciesStream(
      String species) async* {
    try {
      final response = await dio
          .get('$_baseUrl/character', queryParameters: {'species': species});
      final List<CharacterModel> characters = (response.data['results'] as List)
          .map((json) => CharacterModel.fromJson(json))
          .toList();
      yield characters;
    } catch (e) {
      yield [];
    }
  }

  // Filtrar por tipo
  Stream<List<CharacterModel>> getCharactersByTypeStream(String type) async* {
    try {
      final response =
          await dio.get('$_baseUrl/character', queryParameters: {'type': type});
      final List<CharacterModel> characters = (response.data['results'] as List)
          .map((json) => CharacterModel.fromJson(json))
          .toList();
      yield characters;
    } catch (e) {
      yield [];
    }
  }
}
