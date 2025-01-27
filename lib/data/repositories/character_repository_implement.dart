import 'package:prueba_tecnica_flutter_senior/data/data_source/character_data_source.dart';
import 'package:prueba_tecnica_flutter_senior/domain/entities/character_entity.dart';
import 'package:prueba_tecnica_flutter_senior/domain/repositories/character_repository.dart';

class CharacterRepositoryImplement implements CharacterRepository {
  final CharacterDataSource characterDataSource;

  CharacterRepositoryImplement(this.characterDataSource);

  @override
  Future<CharacterEntity> getCharacter(int id) async {
    return (await characterDataSource.getCharacter(id)).toEntity();
  }

  @override
  Stream<List<CharacterEntity>> getCharacters() async* {
    await for (var charactersModels
        in characterDataSource.getCharactersStream()) {
      final characterEntities =
          charactersModels.map((model) => model.toEntity()).toList();
      yield characterEntities;
    }
  }
}
