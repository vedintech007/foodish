import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:ved_foodish/api/mock_fooderlich_service.dart';
import 'package:ved_foodish/components/components.dart';
import 'package:ved_foodish/models/explore_data.dart';

class ExploreScreen extends StatefulWidget {
  ExploreScreen({super.key});

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  final mockService = MockFooderlichService();
  late ScrollController _scrollController;

  void _scrollListener() {
    if (!_scrollController.position.outOfRange) {
      if (_scrollController.offset >= _scrollController.position.maxScrollExtent) {
        log("I am at the bottom of the screen");
      }

      if (_scrollController.offset <= _scrollController.position.minScrollExtent) {
        log("I am at the top of the screen");
      }
    }
  }

  @override
  void initState() {
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: mockService.getExploreData(),
      builder: (BuildContext context, AsyncSnapshot<ExploreData> snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          final recipes = snapshot.data?.todayRecipes ?? [];
          final friendsPost = snapshot.data?.friendPosts ?? [];

          return ListView(
            scrollDirection: Axis.vertical,
            controller: _scrollController,
            children: [
              TodayRecipeListView(
                recipes: recipes,
              ),
              const SizedBox(height: 16),
              FriendPostListView(
                friendPosts: friendsPost,
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
