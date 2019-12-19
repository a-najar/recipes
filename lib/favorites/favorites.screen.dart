import 'package:flutter/material.dart';
import 'package:recipes/category/wedgits/meal.item.dart';
import 'package:recipes/data/models/Meal.dart';

class FavoritesScreen extends StatelessWidget {
  final List<Meal> favoritesMeals;

  FavoritesScreen(this.favoritesMeals);

  @override
  Widget build(BuildContext context) {
    if (favoritesMeals.isEmpty) {
      return Center(
        child: Text("You have no favorites yet - start adding some!"),
      );
    }

    return ListView.builder(
        itemCount: favoritesMeals.length,
        itemBuilder: (ctx, index) {
          Meal meal = favoritesMeals[index];
          return MealItem(
              id: meal.id,
              title: meal.title,
              imageUrl: meal.imageUrl,
              affordabilityText: meal.affordabilityText,
              complexityText: meal.complexityText,
              duration: meal.duration);
        });
  }
}
