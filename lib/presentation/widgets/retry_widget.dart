import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prueba_tecnica_flutter_senior/presentation/cubit/character_cubit.dart';

class RetryWidget extends StatelessWidget {
  const RetryWidget({
    super.key,
    this.message = 'An error occurred',
  });

  final String message;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      spacing: 10,
      children: [
        Text(
          'Something went wrong',
          style: TextStyle(
            color: Colors.yellow,
            fontSize: 30,
            fontFamily: 'schwifty',
          ),
        ),
        Text(
          message,
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
          ),
        ),
        ElevatedButton(
          style: ButtonStyle(
            backgroundColor: WidgetStateProperty.all(
              Colors.red,
            ),
          ),
          onPressed: () {
            context.read<CharacterCubit>().refreshCharacters();
          },
          child: Text(
            'Retry',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ],
    );
  }
}
