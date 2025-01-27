import 'package:equatable/equatable.dart';
import 'package:prueba_tecnica_flutter_senior/domain/entities/character_entity.dart';

abstract class CharacterState extends Equatable {
  const CharacterState();

  @override
  List<Object> get props => [];
}

class CharacterLoading extends CharacterState {}

class CharacterLoaded extends CharacterState {
  final CharacterEntity character;
  const CharacterLoaded(this.character);

  @override
  List<Object> get props => [character];
}

class CharactersLoaded extends CharacterState {
  final List<CharacterEntity> characters;
  const CharactersLoaded(this.characters);

  @override
  List<Object> get props => [characters];
}

class CharacterError extends CharacterState {
  final String message;
  const CharacterError(this.message);

  @override
  List<Object> get props => [message];
}
