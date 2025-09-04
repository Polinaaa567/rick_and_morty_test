import 'package:freezed_annotation/freezed_annotation.dart';

part 'origin.g.dart';
part 'origin.freezed.dart';

@freezed
abstract class Origin with _$Origin {
  const factory Origin({String? name, String? url}) = _Origin;

  factory Origin.fromJson(Map<String, dynamic> json) => _$OriginFromJson(json);
}
