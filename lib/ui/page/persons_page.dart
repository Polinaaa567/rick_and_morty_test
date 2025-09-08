import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:rick_and_morty/core/models/character/character.dart';
import 'package:rick_and_morty/core/providers/cache_provider.dart';
import 'package:rick_and_morty/core/providers/character_provider.dart';
import 'package:rick_and_morty/ui/widgets/character_card.dart';

class CharactersCardScreen extends ConsumerWidget {
  const CharactersCardScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final characterList = ref.watch(
      characterProvider.select((state) => state.characterList),
    );

    final isLoading = ref.watch(
      characterProvider.select((state) => state.isLoadingMore),
    );

    final isNightMode = ref.watch(
      characterProvider.select((state) => state.isNightMode),
    );

    final greenDiamond = Color.fromARGB(255, 66, 244, 179);
    final pinkDark = Color.fromARGB(255, 255, 56, 96);

    return Scaffold(
      backgroundColor: isNightMode
          ? Color.fromARGB(255, 10, 14, 23)
          : Color.fromARGB(255, 240, 254, 249),
      body: characterList.when(
        error: (err, stack) {
          final currentPage = ref.watch(
            characterProvider.select((state) => state.page),
          );
          final cachedData = ref
              .read(cacheServiceProvider)
              .getCharacters(currentPage);

          return FutureBuilder<Character?>(
            future: cachedData,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                final result = snapshot.data!.results ?? [];
                return ListView.separated(
                  itemCount: result.length,
                  itemBuilder: (context, index) =>
                      CharacterCard(character: result[index]),
                  separatorBuilder: (context, index) => SizedBox(height: 17),
                );
              } else {
                return Center(
                  child: Text('Ошибка: $err\nНет кэшированных данных'),
                );
              }
            },
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        data: (list) {
          final result = list.results ?? [];

          return NotificationListener<ScrollNotification>(
            onNotification: (scrollInfo) {
              if (scrollInfo.metrics.pixels >=
                  scrollInfo.metrics.maxScrollExtent * 0.95) {
                if (!isLoading) {
                  ref.read(characterProvider.notifier).fetchAllCharacters();
                }
              }
              return false;
            },
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () =>
                          ref.read(characterProvider.notifier).changeMode(),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            border: BoxBorder.all(
                              color: isNightMode ? greenDiamond : pinkDark,
                            ),
                          ),
                          padding: EdgeInsets.all(10),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(
                                isNightMode ? Icons.nights_stay : Icons.sunny,
                                color: isNightMode ? greenDiamond : pinkDark,
                              ),
                              SizedBox(width: 7),
                              Text(
                                isNightMode ? 'Тёмная тема' : 'Светлая тема',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17,
                                  color: isNightMode ? greenDiamond : pinkDark,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 8,
                      ),
                      separatorBuilder: (context, index) =>
                          SizedBox(height: 17),
                      itemCount: result.length,
                      itemBuilder: (context, index) =>
                          CharacterCard(character: result[index]),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
