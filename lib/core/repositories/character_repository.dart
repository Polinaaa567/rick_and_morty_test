import 'dart:convert';

 import 'package:untitled1/core/models/character/character.dart';
import 'package:http/http.dart' as http;

abstract class ICharacterRepository {
  Future<Character> fetchAllCharacter(int page);
}


class CharacterRepository extends ICharacterRepository {
  @override
  Future<Character> fetchAllCharacter(int page) async {
    final response = await http.get(
      Uri.parse('https://rickandmortyapi.com/api/character/?page=$page'),
    );

    return Character.fromJson(jsonDecode(response.body));
  }
}
