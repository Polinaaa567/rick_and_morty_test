import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:untitled1/core/models/results/results.dart';
import 'package:untitled1/core/repositories/character_repository.dart';
import 'package:untitled1/core/view_models/character_state.dart';

import 'package:logger/logger.dart';

class CharacterNotifier extends StateNotifier<CharacterState> {
  final ICharacterRepository repository;

  CharacterNotifier(this.repository) : super(CharacterState()) {
    fetchAllCharacters();
    _loadFavourite();
  }

  Future<void> _loadFavourite() async {
    final prefs = await SharedPreferences.getInstance();
    final favouriteListJson = prefs.getString('favourite');

    if (favouriteListJson != null) {
      try {
        final List<dynamic> jsonList = jsonDecode(favouriteListJson);

        final List<Results> favouriteList = jsonList
            .map((json) => Results.fromJson(json as Map<String, dynamic>))
            .toList();

        state = state.copyWith(favouriteRickAndMortyList: favouriteList);
      } catch (e) {
        Logger().d('Ошибка при парсинге: $e');
        final List<Results> favouriteList = [];
        state = state.copyWith(favouriteRickAndMortyList: favouriteList);
      }
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

    final prefs = await SharedPreferences.getInstance();

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

    final favouriteListJson = jsonEncode(
      state.favouriteRickAndMortyList?.map((e) => e.toJson()).toList(),
    );
    prefs.setString('favourite', favouriteListJson);

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
