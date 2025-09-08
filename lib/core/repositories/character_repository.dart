import 'dart:convert';

import 'package:logger/logger.dart';
import 'package:rick_and_morty/core/models/character/character.dart';
import 'package:http/http.dart' as http;
import 'package:rick_and_morty/core/models/results/results.dart';
import 'package:rick_and_morty/services/datasource/cache_service.dart';
import 'package:rick_and_morty/services/datasource/favourite_cache_service.dart';

abstract class ICharacterRepository {
  Future<Character> fetchAllCharacter(int page);
  Future<List<Results>> getFavorites();
  Future<void> saveToFavorites(List<Results>? character);
}

class CharacterRepository extends ICharacterRepository {
  final ICacheService cacheService;
  final IFavouriteCacheService favouriteCacheService;

  CharacterRepository({
    required this.favouriteCacheService,
    required this.cacheService,
  });

  @override
  Future<Character> fetchAllCharacter(int page) async {
    if (await cacheService.isCacheValid(page)) {
      final cachedData = await cacheService.getCharacters(page);
      if (cachedData != null) {
        return cachedData;
      }
    }

    final response = await http.get(
      Uri.parse('https://rickandmortyapi.com/api/character/?page=$page'),
    );

    Logger().d('response, ${response.body}');

    if (response.statusCode == 200) {
      final character = Character.fromJson(jsonDecode(response.body));
      Logger().d('character, ${character}');

      await cacheService.saveCharacter(character, page);
      return character;
    } else {
      Logger().d('Failed to load characters: ${response.statusCode}');

      throw Exception('Failed to load characters: ${response.statusCode}');
    }
  }

  @override
  Future<void> saveToFavorites(List<Results>? character) async {
    await favouriteCacheService.saveFavorites(character ?? []);
  }

  @override
  Future<List<Results>> getFavorites() async {
    return await favouriteCacheService.loadFavorites();
  }
}
