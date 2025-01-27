import 'package:get_it/get_it.dart';
import 'package:prueba_tecnica_flutter_senior/data/data_source/character_data_source.dart';
import 'package:prueba_tecnica_flutter_senior/data/data_source/episode_data_source.dart';
import 'package:prueba_tecnica_flutter_senior/data/repositories/character_repository_implement.dart';
import 'package:prueba_tecnica_flutter_senior/data/repositories/episode_repository_implement.dart';
import 'package:prueba_tecnica_flutter_senior/data/utils/dio_client.dart';
import 'package:prueba_tecnica_flutter_senior/domain/repositories/character_repository.dart';
import 'package:prueba_tecnica_flutter_senior/domain/repositories/episode_repository.dart';
import 'package:prueba_tecnica_flutter_senior/presentation/cubit/character_cubit.dart';

GetIt injector = GetIt.instance;
void setupInjector() {
  injector.registerLazySingleton<DioClient>(() => DioClient());
  injector.registerLazySingleton<CharacterDataSource>(
      () => CharacterDataSource(injector<DioClient>()));
  injector.registerLazySingleton<CharacterRepository>(
      () => CharacterRepositoryImplement(injector<CharacterDataSource>()));
  injector.registerFactory<CharacterCubit>(
      () => CharacterCubit(injector<CharacterRepository>()));
  injector.registerLazySingleton<EpisodeDataSource>(
      () => EpisodeDataSource(injector<DioClient>()));
  injector.registerLazySingleton<EpisodeRepository>(
      () => EpisodeRepositoryImplement(injector<EpisodeDataSource>()));
}
