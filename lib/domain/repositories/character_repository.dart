import 'package:prueba_tecnica_flutter_senior/domain/entities/character_entity.dart';

abstract class CharacterRepository {
  Stream<List<CharacterEntity>> getCharacters();
  Future<CharacterEntity> getCharacter(int id);
}
