import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:rick_and_morty/core/models/character/character.dart';
import 'package:rick_and_morty/core/models/results/results.dart';

class CharacterState {
  final AsyncValue<Character> characterList;
  final int page;
  final List<Results>? favouriteRickAndMortyList;
  final bool isLoadingMore;
  final String? error;
  final bool isNightMode;

  CharacterState({
    this.characterList = const AsyncValue.loading(),
    this.page = 1,
    this.favouriteRickAndMortyList,
    this.error,
    this.isLoadingMore = false,
    this.isNightMode = false,
  });

  CharacterState copyWith({
    AsyncValue<Character>? characterList,
    int? page,
    List<Results>? favouriteRickAndMortyList,
    bool? isLoadingMore,
    String? error,
    bool? isNightMode
  }) {
    return CharacterState(
      characterList: characterList ?? this.characterList,
      page: page ?? this.page,
      favouriteRickAndMortyList: favouriteRickAndMortyList ?? this.favouriteRickAndMortyList,
      error: error ?? this.error,
      isLoadingMore: isLoadingMore ?? this.isLoadingMore,
        isNightMode: isNightMode ?? this.isNightMode,
    );
  }
}
