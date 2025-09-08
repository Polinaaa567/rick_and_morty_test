import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rick_and_morty/services/datasource/cache_service.dart';

final cacheServiceProvider = Provider<ICacheService>((ref) => CacheService());
