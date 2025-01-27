import 'package:flutter/material.dart';
import 'package:prueba_tecnica_flutter_senior/domain/entities/character_entity.dart';
import 'package:prueba_tecnica_flutter_senior/presentation/widgets/space_background.dart';
import 'package:shimmer/shimmer.dart';

class CharacterDetailScreen extends StatelessWidget {
  CharacterDetailScreen({super.key, required this.character});

  final CharacterEntity character;

  final headerStyle = TextStyle(
    fontSize: 24,
    color: Colors.yellow,
    fontWeight: FontWeight.bold,
  );

  final textStyle = TextStyle(
    fontSize: 20,
    color: Colors.white,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          character.name,
          style: TextStyle(
            fontSize: 26,
            color: Colors.white,
            fontFamily: 'schwifty',
          ),
        ),
        backgroundColor: Color(0xFF0B132B),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: SpaceBackground(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                AspectRatio(
                  aspectRatio: 16 / 16,
                  child: Image.network(
                    key: Key('image_${character.name}'),
                    character.image,
                    width: double.infinity,
                    fit: BoxFit.cover,
                    loadingBuilder: (context, child, loadingProgress) {
                      if (loadingProgress == null) return child;
                      return Shimmer.fromColors(
                          baseColor: Colors.green[300]!,
                          highlightColor: Colors.green[100]!,
                          child: child);
                    },
                    errorBuilder: (context, error, stackTrace) => Icon(
                      Icons.error,
                      color: Colors.red,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(5),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Status: ', style: headerStyle),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                          color: character.status == 'Alive'
                              ? Colors.green
                              : character.status == 'Dead'
                                  ? Colors.red
                                  : Colors.grey,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Text(
                          character.status,
                          style: textStyle,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(5),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Species: ', style: headerStyle),
                      Text(character.species, style: textStyle),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(5),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Gender: ', style: headerStyle),
                      Text(character.gender, style: textStyle),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(5),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Location: ', style: headerStyle),
                      Text(character.location, style: textStyle),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(5),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Origin: ', style: headerStyle),
                      Text(character.origin, style: textStyle),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(5),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Type: ', style: headerStyle),
                      Text(
                        character.type != '' ? character.type : 'Unknown',
                        style: textStyle,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
