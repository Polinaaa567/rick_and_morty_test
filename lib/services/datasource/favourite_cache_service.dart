import 'dart:convert';

import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:rick_and_morty/core/models/results/results.dart';

abstract class IFavouriteCacheService {
  Future<List<Results>> loadFavorites();
  Future<void> saveFavorites(List<Results>? favorites);
}

class FavouriteCacheService extends IFavouriteCacheService {
  @override
  Future<List<Results>> loadFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    final favouriteListJson = prefs.getString('favourite');

    if (favouriteListJson == null) return [];

    try {
      final List<dynamic> jsonList = jsonDecode(favouriteListJson);
      return jsonList
          .map((json) => Results.fromJson(json as Map<String, dynamic>))
          .toList();
    } catch (e) {
      Logger().d('Ошибка при парсинге: $e');
      return [];
    }
  }

  @override
  Future<void> saveFavorites(List<Results>? favorites) async {
    final prefs = await SharedPreferences.getInstance();
    final jsonList = favorites?.map((character) => character.toJson()).toList();
    await prefs.setString('favourite', jsonEncode(jsonList));
  }
}
