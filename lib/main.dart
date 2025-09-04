import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:untitled1/core/providers/navigation_provider.dart';

void main() => runApp(const ProviderScope(child: RickAndMortyApp()));

class RickAndMortyApp extends ConsumerWidget {
  const RickAndMortyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routerProvider);

    return MaterialApp.router(
      routerConfig: router,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        canvasColor: Colors.greenAccent,
        useMaterial3: true,
      ),
    );
  }
}