import 'package:flutter/material.dart';
import 'package:lab2_213094/services/api_services.dart';

import '../models/joke.dart';

class JokeDetails extends StatefulWidget {
  const JokeDetails({super.key});

  @override
  State<JokeDetails> createState() => _JokeDetailsState();
}

class _JokeDetailsState extends State<JokeDetails> {
  List<Joke> jokes = [];
  String jokeType = '';

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final arguments = ModalRoute.of(context)?.settings.arguments;
    if (arguments == null || arguments is! String) {
      print("Error JOKE TYPE");
      Navigator.pop(context); // Navigate back if arguments are invalid
      return;
    }
    jokeType = arguments;
    getJokesForType(jokeType);
  }

  void getJokesForType(String type) async {
    ApiService.getJokesByType(type).then((response) {
      setState(() {
        jokes = response;
      });
    }).catchError((error) {
      print("Error getting jokes: $error");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        backgroundColor: Colors.black,
        title: Center(
          widthFactor: 2,
          child: Text(
            jokeType,
            style: const TextStyle(
              color: Colors.white,
              decoration: TextDecoration.underline,
            ),
          ),
        ),
      ),
      body: jokes.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: jokes.length,
              itemBuilder: (context, index) {
                final joke = jokes[index];
                return ListTile(
                  title: Text(joke.setup),
                  subtitle: Text(joke.punchline),
                );
              },
            ),
    );
  }
}
