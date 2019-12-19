import 'package:flutter/material.dart';
import 'package:recipes/category/wedgits/meal.item.dart';
import 'package:recipes/data/models/Meal.dart';

class CategoryMealsScreen extends StatefulWidget {
  static const routeName = '/category';
  final List<Meal> _meals;

  CategoryMealsScreen(this._meals);

  @override
  _CategoryMealsScreenState createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  List<Meal> displayedMeals;
  String categoryTitle;
  var _didLoaded = false;

  @override
  void didChangeDependencies() {
    if (!_didLoaded) {
      final routArgs =
          ModalRoute.of(context).settings.arguments as Map<String, String>;
      categoryTitle = routArgs['title'];
      final categoryId = routArgs['id'];
      displayedMeals = widget._meals.where((meal) {
        return meal.categories.contains(categoryId);
      }).toList();
      _didLoaded = true;
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: ListView.builder(
        itemCount: displayedMeals.length,
        itemBuilder: (ctx, index) {
          Meal meal = displayedMeals[index];
          return MealItem(
              id: meal.id,
              title: meal.title,
              imageUrl: meal.imageUrl,
              affordabilityText: meal.affordabilityText,
              complexityText: meal.complexityText,
              duration: meal.duration);
        },
      ),
    );
  }
}
