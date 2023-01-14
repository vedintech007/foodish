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
    final theme = FooderlishTheme.dark();
    return MaterialApp(
      title: 'VED Foodish',
      home: const Home(),
      theme: FooderlishTheme.light(),
      darkTheme: FooderlishTheme.dark(),
      themeMode: ThemeMode.dark,
    );
  }
}
