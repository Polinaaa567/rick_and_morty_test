import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:untitled1/core/models/results/results.dart';
import 'package:untitled1/core/repositories/character_repository.dart';
import 'package:untitled1/core/view_models/character_state.dart';

import 'package:logger/logger.dart';

class CharacterNotifier extends StateNotifier<CharacterState> {
  final ICharacterRepository repository;

  CharacterNotifier(this.repository) : super(CharacterState()) {
    fetchAllCharacters();
  }

  Future<void> fetchAllCharacters() async {
    final currentPagination = state.characterList.value;
    state = state.copyWith(isLoadingMore: true);

    try {
      Logger().d(
        "page state = ${state.page} page value: ${state.characterList.value?.info?.pages} true or false = ${state.page != state.characterList.value?.info?.pages}",
      );

      if (state.page != state.characterList.value?.info?.pages) {
        final newPagination = await repository.fetchAllCharacter(state.page);

        final mergedPagination =
            currentPagination?.copyWith(
              results: [
                ...(currentPagination.results ?? []),
                ...(newPagination.results ?? []),
              ],
            ) ??
            newPagination;

        state = state.copyWith(
          page: state.page + 1,
          characterList: AsyncValue.data(mergedPagination),
        );
      }

      state = state.copyWith(isLoadingMore: false);
    } catch (e) {}
  }

  void changeMode() {
    state = state.copyWith(isNightMode: !state.isNightMode);
  }

  void changeFavoritesCharacter(Results? character) {
    if (character == null) return;

    if(character.isFavorite) {
      final List<Results> favoritesList = [
        ...(state.favouriteRickAndMortyList ?? []),
      ];
      favoritesList.removeWhere((c) => c.id == character.id);

      state.characterList.when(
          data: (characterData) {
            final updatedResults = characterData.results?.map((c) {
              return c.id == character.id ? c.copyWith(isFavorite: false) : c;
            }).toList();

            final updatedCharacterData = characterData.copyWith(
              results: updatedResults,
            );

            state = state.copyWith(
              characterList: AsyncValue.data(updatedCharacterData),
              favouriteRickAndMortyList: favoritesList,
            );
          },
          loading: () {
            state = state.copyWith(favouriteRickAndMortyList: favoritesList);
          },
          error: (error, stack) {
            state = state.copyWith(favouriteRickAndMortyList: favoritesList);
          });

    } else {
      final List<Results> favoritesList = [
        ...(state.favouriteRickAndMortyList ?? []),
      ];
      favoritesList.add(character.copyWith(isFavorite: true));

      state.characterList.when(
        data: (characterData) {
          final updatedResults = characterData.results?.map((c) {
            return c.id == character.id ? c.copyWith(isFavorite: true) : c;
          }).toList();

          final updatedCharacterData = characterData.copyWith(
            results: updatedResults,
          );

          state = state.copyWith(
            characterList: AsyncValue.data(updatedCharacterData),
            favouriteRickAndMortyList: favoritesList,
          );
        },
        loading: () {
          state = state.copyWith(favouriteRickAndMortyList: favoritesList);
        },
        error: (error, stack) {
          state = state.copyWith(favouriteRickAndMortyList: favoritesList);
        },
      );

    }

    Logger().d(
      "Лист фаворитов при добавлении ${state.favouriteRickAndMortyList}",
    );
  }

  void removeFavoritesCharacter(Results? character) {
    if (character == null) return;

    Logger().d(
      "Лист фаворитов при удалении ${state.favouriteRickAndMortyList}",
    );
  }
}
