import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rick_and_morty/core/models/location/location.dart';
import 'package:rick_and_morty/core/models/origin/origin.dart';

part 'results.g.dart';
part 'results.freezed.dart';

@freezed
abstract class Results with _$Results {
  const factory Results({
    int? id,
    String? name,
    String? status,
    String? species,
    String? type,
    String? gender,
    Origin? origin,
    Location? location,
    String? image,
    List<String>? episode,
    String? url,
    String? created,
    @Default(false) bool isFavorite,
  }) = _Results;

  factory Results.fromJson(Map<String, dynamic> json) =>
      _$ResultsFromJson(json);
}
