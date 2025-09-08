import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rick_and_morty/core/repositories/character_repository.dart';
import 'package:rick_and_morty/core/view_models/character_notifier.dart';
import 'package:rick_and_morty/core/view_models/character_state.dart';
import 'package:rick_and_morty/services/datasource/cache_service.dart';
import 'package:rick_and_morty/services/datasource/favourite_cache_service.dart';

final _charactersRepositoryProvider = Provider<ICharacterRepository>(
  (ref) => CharacterRepository(
    favouriteCacheService: FavouriteCacheService(),
    cacheService: CacheService(),
  ),
);

final characterProvider = StateNotifierProvider<CharacterNotifier, CharacterState>(
  (ref) => CharacterNotifier(ref.watch(_charactersRepositoryProvider)),
);
