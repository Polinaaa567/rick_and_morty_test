import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:untitled1/core/providers/character_provider.dart';
import 'package:untitled1/ui/widgets/character_card.dart';

class FavoritesScreen extends ConsumerWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final characterList = ref.watch(
      characterProvider.select((state) => state.favouriteRickAndMortyList),
    );

    final isNightMode = ref.watch(
      characterProvider.select((state) => state.isNightMode),
    );

    return Scaffold(
      backgroundColor: isNightMode
          ? Color.fromARGB(255, 10, 14, 23)
          : Color.fromARGB(255, 240, 254, 249),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 20),
          child: characterList?.isEmpty ?? true
              ? Center(
                  child: Text(
                    'Нет персонажей в избранном',
                    style: TextStyle(fontSize: 20),
                  ),
                )
              : ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 8,
                  ),
                  separatorBuilder: (context, index) => SizedBox(height: 17),
                  itemCount: characterList?.length ?? 0,
                  itemBuilder: (context, index) => CharacterCard(character: characterList?[index]),
                ),
        ),
      ),
    );
  }
}
