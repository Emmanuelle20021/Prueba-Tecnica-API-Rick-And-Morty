import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prueba_tecnica_flutter_senior/domain/repositories/character_repository.dart';
import 'package:prueba_tecnica_flutter_senior/presentation/cubit/character_state.dart';
import 'package:prueba_tecnica_flutter_senior/domain/entities/character_entity.dart';

class CharacterCubit extends Cubit<CharacterState> {
  final CharacterRepository characterRepository;
  final List<CharacterEntity> _characters = [];
  bool _isLoading = false;

  String _filter = '';

  CharacterCubit(this.characterRepository) : super(CharacterLoading());

  void fetchCharacters() {
    if (_isLoading) return;

    _isLoading = true;
    emit(CharacterLoading());

    characterRepository.getCharacters().listen(
      (characters) {
        _characters.addAll(characters);
        _applyFilter();
        emit(CharactersLoaded(_characters));
        _isLoading = false;
      },
      onError: (error) {
        if (error is DioException) {
          switch (error.type) {
            case DioExceptionType.connectionTimeout:
              emit(CharacterError('Not found'));
              break;
            case DioExceptionType.connectionError:
              emit(CharacterError('Connection error'));
              break;
            case DioExceptionType.cancel:
              emit(CharacterError('Request canceled'));
              break;
            case DioExceptionType.badCertificate:
              emit(CharacterError('Bad certificate'));
              break;
            case DioExceptionType.badResponse:
              emit(CharacterError('Bad response'));
              break;
            default:
              emit(CharacterError('Unknown error'));
              break;
          }
        } else {
          emit(CharacterError('$error'));
        }
        _isLoading = false;
      },
    );
  }

  void setFilter(String filter) {
    _filter = filter;
    _applyFilter();
  }

  void _applyFilter() {
    if (_filter.isEmpty) {
      emit(CharactersLoaded(_characters));
    } else {
      final filteredCharacters = _characters
          .where((character) =>
              character.name.toLowerCase().contains(_filter.toLowerCase()))
          .toList();
      emit(CharactersLoaded(filteredCharacters));
    }
  }

  void refreshCharacters() {
    _characters.clear();
    fetchCharacters();
  }
}
