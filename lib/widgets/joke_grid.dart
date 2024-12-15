import 'package:flutter/material.dart';
import 'package:lab2_213094/screens/details.dart';
import 'package:lab2_213094/widgets/joke_card.dart';

class JokeGrid extends StatelessWidget {
  final List<String> jokeTypes;

  const JokeGrid({super.key, required this.jokeTypes});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.fromLTRB(7.5, 7.5, 7.5, 0),
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200, // Maximum width of each grid item
        childAspectRatio: 1.5, // Aspect ratio of the grid items
        crossAxisSpacing: 7.5, // Horizontal space between grid items
        mainAxisSpacing: 7.5, // Vertical space between grid items
      ),
      itemCount: jokeTypes.length,
      itemBuilder: (context, index) {
        final jokeType = jokeTypes[index];
        return JokeCard(
          jokeType: jokeType,
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const JokeDetails(),
                settings: RouteSettings(arguments: jokeType),
              ),
            );
          },
        );
      },
    );
  }
}
