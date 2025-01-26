import 'package:prueba_tecnica_flutter_senior/data/data_source/episode_data_source.dart';
import 'package:prueba_tecnica_flutter_senior/domain/entities/episode_entity.dart';
import 'package:prueba_tecnica_flutter_senior/domain/repositories/episode_repository.dart';

class EpisodeRepositoryImplement implements EpisodeRepository {
  final EpisodeDataSource episodeDataSource;

  EpisodeRepositoryImplement(this.episodeDataSource);

  @override
  Future<EpisodeEntity> getEpisode(int episodeId) async {
    return (await episodeDataSource.getEpisode(episodeId)).toEntity();
  }

  @override
  Stream<List<EpisodeEntity>> getEpisodes() async* {
    await for (var episodesModels in episodeDataSource.getEpisodes()) {
      final characterEntities =
          episodesModels.map((model) => model.toEntity()).toList();
      yield characterEntities;
    }
  }
}
