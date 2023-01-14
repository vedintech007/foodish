import 'package:flutter/material.dart';
import 'package:ved_foodish/fooderlich_theme.dart';
import 'package:ved_foodish/home.dart';

void main() {
  runApp(const Fooderlich());
}

class Fooderlich extends StatelessWidget {
  const Fooderlich({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'VED Foodish',
      home: const Home(),
      theme: FooderlichTheme.light(),
      darkTheme: FooderlichTheme.dark(),
      themeMode: ThemeMode.dark,
    );
  }
}
