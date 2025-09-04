import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:untitled1/core/providers/character_provider.dart';
import 'package:untitled1/ui/widgets/character_card.dart';

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


    return Scaffold(
      backgroundColor: Color.fromARGB(255, 240, 254, 249),
      body: characterList.when(
        error: (err, stack) => Center(child: Text('Ошибка: $err')),
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
                padding: EdgeInsets.symmetric(vertical: 20),
                child: Column(
                  children: [

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
