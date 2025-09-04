import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'package:untitled1/ui/navigation.dart';
import 'package:untitled1/ui/page/favorites_page.dart';
import 'package:untitled1/ui/page/persons_page.dart';

final navIndexProvider = StateProvider<int>((ref) => 0);

final routerProvider = Provider<GoRouter>((ref) {
  final navIndexNotifier = ref.read(navIndexProvider.notifier);

  return GoRouter(
    initialLocation: '/',
    routes: [
      ShellRoute(
        builder: (context, state, child) {
          return Scaffold(
              body: child,
              bottomNavigationBar: NavigationMenu()
          );
        },
        routes: [
          GoRoute(
            path: '/',
            pageBuilder: (context, state) => CustomTransitionPage(
              child:  CharactersCardScreen(),
              transitionsBuilder: (_, animation, __, child) =>
                  FadeTransition(opacity: animation, child: child),
            ),
          ),
          GoRoute(
            path: '/character',
            builder: (context, state) => CharactersCardScreen(),
          ),
          GoRoute(
            path: '/favourites',
            builder: (context, state) => FavoritesScreen(),
          ),
        ],
      ),
    ],
    redirect: (context, state) {
      final location = state.path;
      if (location == '/' || location == '/character') {
        navIndexNotifier.state = 0;
      } else if (location == '/favourites') {
        navIndexNotifier.state = 1;
      }

      return null;
    },
  );
});
