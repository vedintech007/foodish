import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:ved_foodish/api/mock_fooderlich_service.dart';
import 'package:ved_foodish/components/components.dart';
import 'package:ved_foodish/components/today_recipe_list_view.dart';
import 'package:ved_foodish/models/explore_data.dart';

class ExploreScreen extends StatelessWidget {
  ExploreScreen({super.key});

  final mockService = MockFooderlichService();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: mockService.getExploreData(),
      builder: (BuildContext context, AsyncSnapshot<ExploreData> snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          final recipes = snapshot.data?.todayRecipes ?? [];

          return ListView(
            scrollDirection: Axis.vertical,
            children: [
              TodayRecipeListView(
                recipes: recipes,
              ),
              const SizedBox(height: 16),
              FriendPostListView(
                friendPosts: snapshot.data?.friendPosts ?? [],
              ),
            ],
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
