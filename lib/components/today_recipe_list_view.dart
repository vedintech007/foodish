import 'package:flutter/material.dart';
import 'package:ved_foodish/components/components.dart';
import 'package:ved_foodish/models/models.dart';

class TodayRecipeListView extends StatelessWidget {
  const TodayRecipeListView({
    super.key,
    required this.recipes,
  });

  final List<ExploreRecipe> recipes;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 16,
        right: 16,
        left: 16,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Recipes of the Day',
            style: Theme.of(context).textTheme.headline1,
          ),
          const SizedBox(height: 16),
          // 7
          Container(
            height: 400,
            color: Colors.transparent,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: recipes.length,
              separatorBuilder: (context, index) {
                return const SizedBox(width: 16);
              },
              itemBuilder: (context, index) {
                final recipe = recipes[index];
                return buildCard(recipe);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget buildCard(ExploreRecipe recipe) {
    if (recipe.cardType == RecipeCardType.card1) {
      return Card1(recipe: recipe);
    } else if (recipe.cardType == RecipeCardType.card2) {
      return Card2(recipe: recipe);
    } else if (recipe.cardType == RecipeCardType.card3) {
      return Card3(recipe: recipe);
    } else {
      throw Exception('This card doesn\'t exist yet');
    }
  }
}
