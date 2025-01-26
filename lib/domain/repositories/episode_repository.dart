import 'package:prueba_tecnica_flutter_senior/domain/entities/episode_entity.dart';

abstract class EpisodeRepository {
  Stream<List<EpisodeEntity>> getEpisodes();
  Future<EpisodeEntity> getEpisode(int episodeId);
}
