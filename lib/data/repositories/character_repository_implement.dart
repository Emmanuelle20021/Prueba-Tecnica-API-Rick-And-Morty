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

  @override
  Stream<List<CharacterEntity>> getCharactersByEpisode(String episode) async* {
    await for (var charactersModels
        in characterDataSource.getCharactersByEpisodeStream(episode)) {
      final characterEntities =
          charactersModels.map((model) => model.toEntity()).toList();
      yield characterEntities;
    }
  }

  @override
  Stream<List<CharacterEntity>> getCharactersByLocation(
      String location) async* {
    await for (var charactersModels
        in characterDataSource.getCharactersByLocationStream(location)) {
      final characterEntities =
          charactersModels.map((model) => model.toEntity()).toList();
      yield characterEntities;
    }
  }

  @override
  Stream<List<CharacterEntity>> getCharactersBySpecies(String species) async* {
    await for (var charactersModels
        in characterDataSource.getCharactersBySpeciesStream(species)) {
      final characterEntities =
          charactersModels.map((model) => model.toEntity()).toList();
      yield characterEntities;
    }
  }

  @override
  Stream<List<CharacterEntity>> getCharactersByStatus(String status) async* {
    await for (var charactersModels
        in characterDataSource.getCharactersByStatusStream(status)) {
      final characterEntities =
          charactersModels.map((model) => model.toEntity()).toList();
      yield characterEntities;
    }
  }

  @override
  Stream<List<CharacterEntity>> getCharactersByType(String type) async* {
    await for (var charactersModels
        in characterDataSource.getCharactersByTypeStream(type)) {
      final characterEntities =
          charactersModels.map((model) => model.toEntity()).toList();
      yield characterEntities;
    }
  }
}
