import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prueba_tecnica_flutter_senior/presentation/cubit/character_cubit.dart';
import 'package:prueba_tecnica_flutter_senior/presentation/cubit/character_state.dart';
import 'package:prueba_tecnica_flutter_senior/presentation/pages/character_details.dart';
import 'package:prueba_tecnica_flutter_senior/presentation/widgets/loading_list_shimmer.dart';
import 'package:prueba_tecnica_flutter_senior/presentation/widgets/retry_widget.dart';
import 'package:shimmer/shimmer.dart';

class CharacterList extends StatelessWidget {
  const CharacterList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocBuilder<CharacterCubit, CharacterState>(
        builder: (context, state) {
          if (state is CharacterLoading) {
            return LoadingListShimmer();
          } else if (state is CharacterError) {
            return RetryWidget(
              message: state.message,
            );
          } else if (state is CharactersLoaded) {
            final characters = state.characters;
            if (characters.isEmpty) {
              return Center(
                child: Text(
                  'No characters found',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontFamily: 'schwifty',
                  ),
                ),
              );
            }
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
                                : const Color.fromARGB(139, 244, 67, 54),
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
                      frameBuilder:
                          (context, child, frame, wasSynchronouslyLoaded) =>
                              wasSynchronouslyLoaded
                                  ? child
                                  : AnimatedOpacity(
                                      opacity: frame == null ? 0 : 1,
                                      duration: const Duration(seconds: 1),
                                      curve: Curves.easeOut,
                                      child: child,
                                    ),
                      errorBuilder: (context, error, stackTrace) => Icon(
                        Icons.error,
                        color: Colors.red,
                      ),
                      loadingBuilder: (context, child, loadingProgress) {
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
          return RetryWidget(
            message: 'Unknown state',
          );
        },
      ),
    );
  }
}
