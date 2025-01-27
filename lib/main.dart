import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prueba_tecnica_flutter_senior/domain/entities/character_entity.dart';
import 'package:prueba_tecnica_flutter_senior/domain/repositories/episode_repository.dart';
import 'package:prueba_tecnica_flutter_senior/presentation/cubit/character_cubit.dart';
import 'package:prueba_tecnica_flutter_senior/presentation/cubit/character_state.dart';
import 'package:prueba_tecnica_flutter_senior/presentation/utils/injector.dart';
import 'package:shimmer/shimmer.dart';

void main() {
  setupInjector();
  runApp(
    RootWidget(),
  );
}

class RootWidget extends StatelessWidget {
  const RootWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (_) => injector<CharacterCubit>()..fetchCharacters(),
          ),
        ],
        child: Scaffold(
          extendBodyBehindAppBar: true,
          body: SpaceBackground(
            child: HomeScreen(),
          ),
        ),
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  HomeScreen({
    super.key,
  });

  final SearchController searchController = SearchController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          spacing: 15,
          children: [
            SizedBox(),
            Row(
              spacing: 10,
              children: [
                Text(
                  'Rick and Morty',
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.green,
                    fontFamily: 'schwifty',
                  ),
                ),
              ],
            ),
            SearchBar(
              constraints: BoxConstraints(
                minHeight: 40,
                maxHeight: 40,
              ),
              controller: searchController,
              elevation: WidgetStateProperty.all(0),
              leading: Icon(
                Icons.search,
              ),
              padding: WidgetStateProperty.all(
                EdgeInsets.symmetric(horizontal: 10),
              ),
              onChanged: (value) =>
                  context.read<CharacterCubit>().setFilter(value),
            ),
            Expanded(
              child: BlocBuilder<CharacterCubit, CharacterState>(
                builder: (context, state) {
                  if (state is CharacterLoading) {
                    return ListView.builder(
                      itemBuilder: (context, index) {
                        return Shimmer.fromColors(
                          baseColor: Colors.green[300]!,
                          highlightColor: Colors.green[100]!,
                          child: ListTile(
                            title: Container(
                              width: double.infinity,
                              height: 10,
                              color: Colors.white,
                            ),
                            subtitle: Container(
                              width: 10,
                              height: 8,
                              color: Colors.white,
                            ),
                            leading: Container(
                              width: 50,
                              height: 50,
                              color: Colors.white,
                            ),
                          ),
                        );
                      },
                    );
                  } else if (state is CharacterError) {
                    return Center(child: Text(state.message));
                  } else if (state is CharactersLoaded) {
                    final characters = state.characters;
                    return RefreshIndicator(
                      onRefresh: () async {
                        context.read<CharacterCubit>().refreshCharacters();
                      },
                      child: ListView.builder(
                        itemCount: characters.length,
                        itemBuilder: (context, index) {
                          final character = characters[index];
                          return ListTile(
                            title: Text(
                              character.name,
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                              ),
                            ),
                            subtitle: Row(
                              children: [
                                Container(
                                  padding: EdgeInsets.symmetric(horizontal: 10),
                                  decoration: BoxDecoration(
                                    color: character.status == 'Alive'
                                        ? const Color.fromARGB(139, 76, 175, 79)
                                        : const Color.fromARGB(
                                            139, 244, 67, 54),
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: Text(
                                    character.status,
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.white.withAlpha(220),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => CharacterDetailScreen(
                                  character: character,
                                ),
                              ),
                            ),
                            internalAddSemanticForOnTap: true,
                            leading: Image.network(
                              key: Key('image_${character.name}'),
                              character.image,
                              alignment: AlignmentDirectional.centerStart,
                              width: 50,
                              cacheWidth: 50,
                              frameBuilder: (context, child, frame,
                                      wasSynchronouslyLoaded) =>
                                  wasSynchronouslyLoaded
                                      ? child
                                      : AnimatedOpacity(
                                          opacity: frame == null ? 0 : 1,
                                          duration: const Duration(seconds: 1),
                                          curve: Curves.easeOut,
                                          child: child,
                                        ),
                              errorBuilder: (context, error, stackTrace) =>
                                  Icon(
                                Icons.error,
                                color: Colors.red,
                              ),
                              loadingBuilder:
                                  (context, child, loadingProgress) {
                                if (loadingProgress == null) return child;
                                return Shimmer.fromColors(
                                  baseColor: Colors.grey[300]!,
                                  highlightColor: Colors.grey[100]!,
                                  child: SizedBox(
                                    width: 50,
                                    height: 50,
                                    child: Container(
                                      color: Colors.white,
                                    ),
                                  ),
                                );
                              },
                            ),
                            leadingAndTrailingTextStyle: TextStyle(
                              fontSize: 16,
                            ),
                          );
                        },
                      ),
                    );
                  }
                  return Center(
                    child: Text('No hay personajes para ver'),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CharacterDetailScreen extends StatelessWidget {
  const CharacterDetailScreen({super.key, required this.character});

  final CharacterEntity character;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          character.name,
          style: TextStyle(
            fontSize: 20,
            color: Colors.white,
            fontFamily: 'schwifty',
          ),
        ),
        backgroundColor: Color(0xFF0B132B),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: SpaceBackground(
        child: Column(
          children: [
            Image.network(
              key: Key('image_${character.name}'),
              character.image,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text(
                    'Status: ',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    character.status,
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text(
                    'Spacies: ',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    character.species,
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text(
                    'Gender: ',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    character.gender,
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text(
                    'Location: ',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    character.location,
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text(
                    'Origin: ',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    character.origin,
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text(
                    'Type: ',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    character.type != '' ? character.type : 'Unknown',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.1,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => Card(
                  child: FutureBuilder(
                      future: injector<EpisodeRepository>().getEpisode(
                          character.episodes[index].characters.last as int),
                      builder: (context, snapshot) {
                        snapshot.connectionState == ConnectionState.waiting
                            ? CircularProgressIndicator()
                            : snapshot.hasError
                                ? Text('Error: ${snapshot.error}')
                                : Text('Episode ${index + 1}');
                        return Stack(
                          alignment: Alignment.center,
                          children: [
                            Text(
                              'Episode ${index + 1}',
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        );
                      }),
                ),
                itemCount: character.episodes.length,
              ),
            )
          ],
        ),
      ),
    );
  }
}

class SpaceBackground extends StatelessWidget {
  const SpaceBackground({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xFF0B132B), // Azul oscuro (espacio profundo)
            Color(0xFF1C2541), // Azul intermedio
          ],
        ),
      ),
      child: Stack(
        children: [
          // Capa de estrellas (opcional)
          Positioned.fill(
            child: CustomPaint(
              painter: StarPainter(),
            ),
          ),
          // Contenido principal
          child,
        ],
      ),
    );
  }
}

// Clase para pintar estrellas en el fondo
class StarPainter extends CustomPainter {
  final int numberOfStars = 100; // Número de estrellas
  final double starSize = 2; // Tamaño de las estrellas

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()..color = Colors.white.withAlpha(80);
    final Random random = Random();

    for (int i = 0; i < numberOfStars; i++) {
      final double x = random.nextDouble() * size.width;
      final double y = random.nextDouble() * size.height;
      canvas.drawCircle(Offset(x, y), starSize, paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
