import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prueba_tecnica_flutter_senior/presentation/cubit/character_cubit.dart';
import 'package:prueba_tecnica_flutter_senior/presentation/widgets/charecter_list.dart';

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
            CharacterList(),
          ],
        ),
      ),
    );
  }
}
