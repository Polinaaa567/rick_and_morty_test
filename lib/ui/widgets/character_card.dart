import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:rick_and_morty/core/models/results/results.dart';
import 'package:rick_and_morty/core/providers/character_provider.dart';

class CharacterCard extends ConsumerWidget {
  final Results? character;

  const CharacterCard({super.key, required this.character});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final greenDiamond = Color.fromARGB(255, 66, 244, 179);
    final pinkDark = Color.fromARGB(255, 255, 56, 96);

    final isNightMode = ref.watch(
      characterProvider.select((state) => state.isNightMode),
    );

    return Card(
      color: isNightMode
          ? Color.fromARGB(255, 26, 36, 57)
          : Color.fromARGB(255, 247, 242, 250),
      elevation: 10,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      shadowColor: isNightMode ? pinkDark : greenDiamond,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: BoxBorder.all(color: isNightMode ? pinkDark : greenDiamond),
        ),
        child: SizedBox(
          width: double.infinity,
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15),
                  bottomLeft: Radius.circular(15),
                ),
                child: FutureBuilder<File>(
                  future: DefaultCacheManager().getSingleFile(character?.image ?? ""),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      if (kIsWeb) {
                        return Image.network(
                          character?.image ?? "",
                          width: 170,
                          fit: BoxFit.cover,
                        );
                      } else {
                        return Image.file(
                          snapshot.data!,
                          width: 130,
                          fit: BoxFit.cover,
                        );
                      }
                    } else if (snapshot.hasError) {
                      return Image.asset(
                        'assets/image/rick_morty.png',
                        width: 130,
                      );
                    } else {
                      return CircularProgressIndicator();
                    }
                  },
                ),
              ),
              // ClipRRect(
              //   borderRadius: BorderRadius.only(
              //     topLeft: Radius.circular(15),
              //     bottomLeft: Radius.circular(15),
              //   ),
              //   child: Image.network(
              //     character?.image ?? "",
              //     width: 150,
              //     fit: BoxFit.cover,
              //     errorBuilder: (context, error, stackTrace) {
              //       return Image.asset(
              //         width: 140,
              //         'assets/image/rick_morty.png',
              //       );
              //     },
              //   ),
              // ),
              SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            character?.name ?? '',
                            style: GoogleFonts.comicNeue(
                              color: pinkDark,
                              shadows: [
                                Shadow(
                                  offset: Offset(0.75, 0.75),
                                  blurRadius: 3.0,
                                  color: greenDiamond,
                                ),
                              ],
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        IconButton(
                          icon: Icon(
                            character?.isFavorite == true
                                ? Icons.star
                                : Icons.star_border,
                            color: pinkDark,
                          ),
                          onPressed: () {
                            ref
                                .read(characterProvider.notifier)
                                .changeFavoritesCharacter(character);
                          },
                        ),
                      ],
                    ),
                    RichText(
                      text: TextSpan(
                        style: TextStyle(
                          color: isNightMode ? pinkDark : Colors.black,
                          fontSize: 16,
                        ),
                        children: <TextSpan>[
                          TextSpan(text: 'Статус: '),
                          TextSpan(
                            text: character?.status,
                            style: TextStyle(
                              color: character?.status == 'Alive'
                                  ? greenDiamond
                                  : character?.status == 'Dead'
                                  ? pinkDark
                                  : isNightMode
                                  ? Colors.white
                                  : Color.fromARGB(255, 0, 0, 0),
                              fontWeight: FontWeight.bold,
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 5),
                      child: RichText(
                        text: TextSpan(
                          style: TextStyle(
                            color: isNightMode ? pinkDark : Colors.black,
                            fontSize: 16,
                            // fontWeight: FontWeight.bold,
                          ),
                          children: <TextSpan>[
                            TextSpan(text: 'Расса: '),
                            TextSpan(
                              text: character?.species,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: isNightMode
                                    ? Colors.white
                                    : Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    RichText(
                      text: TextSpan(
                        style: TextStyle(
                          color: isNightMode ? pinkDark : Colors.black,
                          fontSize: 16,
                        ),
                        children: <TextSpan>[
                          TextSpan(text: 'Начало: '),
                          TextSpan(
                            text: character?.origin?.name,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: isNightMode ? Colors.white : Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
