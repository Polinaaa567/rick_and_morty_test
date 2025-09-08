import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rick_and_morty/core/models/info/info.dart';
import 'package:rick_and_morty/core/models/results/results.dart';

part 'character.g.dart';
part 'character.freezed.dart';

@freezed
abstract class Character with _$Character {
  const factory Character({Info? info, List<Results>? results}) = _Character;

  factory Character.fromJson(Map<String, dynamic> json) =>
      _$CharacterFromJson(json);
}
