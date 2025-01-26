import 'package:prueba_tecnica_flutter_senior/domain/entities/character_entity.dart';

abstract class CharacterRepository {
  Stream<List<CharacterEntity>> getCharacters();
  Future<CharacterEntity> getCharacter(int id);
  Stream<List<CharacterEntity>> getCharactersByEpisode(String episode);
  Stream<List<CharacterEntity>> getCharactersByLocation(String location);
  Stream<List<CharacterEntity>> getCharactersByStatus(String status);
  Stream<List<CharacterEntity>> getCharactersBySpecies(String species);
  Stream<List<CharacterEntity>> getCharactersByType(String type);
}
