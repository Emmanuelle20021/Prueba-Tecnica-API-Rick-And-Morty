import 'package:dio/dio.dart';
import 'package:prueba_tecnica_flutter_senior/data/models/episode_model.dart';

class EpisodeDataSource {
  final Dio dio;

  EpisodeDataSource(this.dio);

  final String _baseUrl = 'https://rickandmortyapi.com/api/episode';

  Future<EpisodeModel> getEpisode(int episodeId) async {
    try {
      final response = await dio.get('$_baseUrl/episode/$episodeId');
      final episode = EpisodeModel.fromJson(response.data);
      return episode;
    } catch (e) {
      return EpisodeModel(
        id: -1,
        name: 'none',
        airDate: 'none',
        episode: 'none',
        characters: [],
      ); // Retorna un episodio ficticio en caso de error
    }
  }

  Stream<List<EpisodeModel>> getEpisodes() async* {
    try {
      final response = await dio.get('$_baseUrl/episode');
      final List<EpisodeModel> episodes = (response.data['results'] as List)
          .map((json) => EpisodeModel.fromJson(json))
          .toList();
      yield episodes;
    } catch (e) {
      yield []; // Retorna una lista vacía en caso de error
    }
  }
}
