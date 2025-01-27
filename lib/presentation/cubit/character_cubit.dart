import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prueba_tecnica_flutter_senior/domain/repositories/character_repository.dart';
import 'package:prueba_tecnica_flutter_senior/presentation/cubit/character_state.dart';
import 'package:prueba_tecnica_flutter_senior/domain/entities/character_entity.dart';

class CharacterCubit extends Cubit<CharacterState> {
  final CharacterRepository characterRepository;
  final List<CharacterEntity> _characters = []; // Lista de personajes cargados
  bool _isLoading = false; // Para evitar que se cargue más de una vez

  // El filtro aplicado a los personajes cargados
  String _filter = '';

  CharacterCubit(this.characterRepository) : super(CharacterLoading());

  // Método para obtener los personajes
  void fetchCharacters() {
    if (_isLoading) return; // Evitar que se cargue más si ya se está cargando

    _isLoading = true;
    emit(CharacterLoading());

    characterRepository.getCharacters().listen(
      (characters) {
        _characters
            .addAll(characters); // Agregar los nuevos personajes a la lista
        _applyFilter(); // Aplicar el filtro a los personajes cargados
        emit(CharactersLoaded(_characters)); // Emitir el nuevo estado
        _isLoading = false;
      },
      onError: (error) {
        emit(CharacterError('Error fetching characters: $error'));
        _isLoading = false;
      },
    );
  }

  // Método para aplicar un filtro sobre los personajes cargados
  void setFilter(String filter) {
    _filter = filter;
    _applyFilter();
  }

  // Aplicar el filtro a los personajes cargados
  void _applyFilter() {
    if (_filter.isEmpty) {
      emit(CharactersLoaded(
          _characters)); // Si no hay filtro, mostrar todos los personajes
    } else {
      final filteredCharacters = _characters
          .where((character) =>
              character.name.toLowerCase().contains(_filter.toLowerCase()))
          .toList();
      emit(CharactersLoaded(
          filteredCharacters)); // Emitir los personajes filtrados
    }
  }

  // Método para recargar más personajes (pull-to-refresh)
  void refreshCharacters() {
    _characters.clear(); // Limpiar la lista actual de personajes
    fetchCharacters(); // Recargar los personajes
  }
}
