import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prueba_tecnica_flutter_senior/presentation/cubit/character_cubit.dart';
import 'package:prueba_tecnica_flutter_senior/presentation/pages/home_screen.dart';
import 'package:prueba_tecnica_flutter_senior/presentation/utils/injector.dart';
import 'package:prueba_tecnica_flutter_senior/presentation/widgets/space_background.dart';

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
