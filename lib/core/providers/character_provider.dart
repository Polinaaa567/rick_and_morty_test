import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:untitled1/core/repositories/character_repository.dart';
import 'package:untitled1/core/view_models/character_notifier.dart';
import 'package:untitled1/core/view_models/character_state.dart';

final _charactersRepositoryProvider = Provider<ICharacterRepository>((ref) {
  return CharacterRepository();
});

final characterProvider = StateNotifierProvider<CharacterNotifier, CharacterState>((ref) {
  return CharacterNotifier(ref.watch(_charactersRepositoryProvider));
});