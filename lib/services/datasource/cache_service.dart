import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:rick_and_morty/core/models/character/character.dart';

abstract class ICacheService {
  Future<void> saveCharacter(Character character, int page);
  Future<Character?> getCharacters(int page);
  Future<bool> isCacheValid(int page);
  Future<void> clearCache(int page);
}

class CacheService extends ICacheService {
  @override
  Future<void> saveCharacter(Character character, int page) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final jsonString = jsonEncode(character.toJson());

    await prefs.setString('character_cache_$page', jsonString);

    await prefs.setString(
      'timestamp_$page',
      DateTime.now().millisecondsSinceEpoch.toString(),
    );
  }

  @override
  Future<Character?> getCharacters(int page) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final jsonString = prefs.getString('character_cache_$page');
    if (jsonString != null) {
      return Character.fromJson(jsonDecode(jsonString));
    }

    return null;
  }

  @override
  Future<bool> isCacheValid(int page) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();

    final timeStampString = prefs.getString('timestamp_$page');
    if (timeStampString != null) {
      final timestamp = int.parse(timeStampString);
      final now = DateTime.now().millisecondsSinceEpoch;
      return (now - timestamp) < (24 * 60 * 60 * 1000);
    }
    return false;
  }

  @override
  Future<void> clearCache(int page) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    await prefs.remove('character_cache_$page');
    await prefs.remove('timestamp_$page');
  }
}
