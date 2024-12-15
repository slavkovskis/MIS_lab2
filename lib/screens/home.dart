import 'package:flutter/material.dart';
import 'package:lab2_213094/screens/random_joke.dart';
import 'package:lab2_213094/services/api_services.dart';

import '../widgets/joke_grid.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<String> jokeTypes = [];

  @override
  void initState() {
    super.initState();
    getJokeTypesFromAPI();
  }

  void getJokeTypesFromAPI() async {
    ApiService.getJokeTypes().then((response) {
      setState(() {
        jokeTypes = response;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text('213094',
              style: TextStyle(
                color: Colors.black,
                decoration: TextDecoration.underline,
              ),
        ),
        actions: [
          IconButton(
            icon: const Text(
              "RANDOM",
              style: TextStyle(
                color: Colors.black,
                decoration: TextDecoration.underline,
              ),
            ),
            onPressed: () async {
              final randomJoke = await ApiService.getRandomJoke();
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => RandomJoke(joke: randomJoke),
                ),
              );
            },
          ),
        ],
      ),
      body: jokeTypes.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : JokeGrid(jokeTypes: jokeTypes),
    );
  }
}
