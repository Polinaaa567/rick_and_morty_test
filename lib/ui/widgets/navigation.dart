import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:go_router/go_router.dart';

import 'package:rick_and_morty/core/providers/navigation_provider.dart';

class NavigationMenu extends ConsumerWidget {
  const NavigationMenu({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentIndex = ref.watch(navIndexProvider);

    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: (index) async => _onItemTapped(index, ref, context),
      items: [
        BottomNavigationBarItem(
          icon: SizedBox(
            child: Image.asset('assets/image/rick_morty.png', width: 30),
          ),
          label: "Персонажи",
        ),
        BottomNavigationBarItem(
          icon: Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.black,
                  blurRadius: 10.0,
                  spreadRadius: 0,
                ),
              ],
            ),
            child: Image.asset('assets/image/star.png', width: 30),
          ),
          label: "Избранное",
        ),
      ],
    );
  }

  void _onItemTapped(int index, WidgetRef ref, BuildContext context) async {
    ref.read(navIndexProvider.notifier).state = index;

    switch (index) {
      case 0:
        context.go('/character');
        break;
      case 1:
        context.go('/favourites');
        break;
    }
  }
}
