import 'package:flutter/material.dart';
import 'package:lab2_213094/screens/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: '213094-Jokes',
      home: Home(),
    );
  }
}
