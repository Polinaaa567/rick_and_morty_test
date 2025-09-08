import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';

import 'package:rick_and_morty/core/models/results/results.dart';
import 'package:rick_and_morty/core/repositories/character_repository.dart';
import 'package:rick_and_morty/core/view_models/character_state.dart';

class CharacterNotifier extends StateNotifier<CharacterState> {
  final ICharacterRepository repository;

  CharacterNotifier(this.repository) : super(CharacterState()) {
    fetchAllCharacters();
    _loadFavourite();
  }

  Future<void> _loadFavourite() async {
    try {
      final favorites = await repository.getFavorites();
      state = state.copyWith(favouriteRickAndMortyList: favorites);
    } catch (e) {
      Logger().e('Ошибка при загрузке избранного: $e');
      state = state.copyWith(
        favouriteRickAndMortyList: [],
        error: 'Не удалось загрузить избранное',
      );
    }
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

        final favoriteIds = state.favouriteRickAndMortyList
            ?.map((character) => character.id)
            .toSet();

        final updatedNewResults = newPagination.results?.map((character) {
          final isFavorite = favoriteIds?.contains(character.id) ?? false;
          return character.copyWith(isFavorite: isFavorite);
        }).toList();

        final updatedNewPagination = newPagination.copyWith(
          results: updatedNewResults,
        );

        final mergedPagination =
            currentPagination?.copyWith(
              results: [
                ...(currentPagination.results ?? []),
                ...(newPagination.results ?? []),
              ],
              info: updatedNewPagination.info,
            ) ??
            updatedNewPagination;

        state = state.copyWith(
          page: state.page + 1,
          characterList: AsyncValue.data(mergedPagination),
          isLoadingMore: false,
        );
      }
    } catch (e) {}
  }

  void changeMode() {
    state = state.copyWith(isNightMode: !state.isNightMode);
  }

  Future<void> changeFavoritesCharacter(Results? character) async {
    if (character == null) return;

    if (character.isFavorite) {
      final List<Results> favoritesList = [
        ...(state.favouriteRickAndMortyList ?? []),
      ];
      favoritesList.removeWhere((c) => c.id == character.id);

      favoritesList.sort((a, b) => a.name!.compareTo(b.name ?? ""));

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
        },
      );
    } else {
      final List<Results> favoritesList = [
        ...(state.favouriteRickAndMortyList ?? []),
      ];
      favoritesList.add(character.copyWith(isFavorite: true));

      favoritesList.sort((a, b) => a.name!.compareTo(b.name ?? ""));

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

    await repository.saveToFavorites(state.favouriteRickAndMortyList);

    Logger().d(
      "Лист фаворитов при добавлении ${state.favouriteRickAndMortyList}",
    );
  }
}
