import 'package:flutter/material.dart';
import 'package:recipes/category/category.meals.screen.dart';
import 'package:recipes/data/dummy.data.dart';
import 'package:recipes/data/models/Meal.dart';
import 'package:recipes/filters/filters.screen.dart';
import 'package:recipes/main.tabs.screen.dart';
import 'package:recipes/meal/meal.screen.dart';

void main() => runApp(RecipesApp());

class RecipesApp extends StatefulWidget {
  @override
  _RecipesAppState createState() => _RecipesAppState();
}

class _RecipesAppState extends State<RecipesApp> {
  Map<String, bool> _filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false,
  };

  List<Meal> _meals = DUMMY_MEALS;
  List<Meal> _favoritesMeals = [];

  void _togaleFavorite(String mealId) {
    final existingId = _favoritesMeals.indexWhere((meal) {
      return meal.id == mealId;
    });

    if (existingId >= 0) {
      setState(() {
        _favoritesMeals.removeAt(existingId);
      });
    } else {
      setState(() {
        _favoritesMeals.add(DUMMY_MEALS.firstWhere((meal) {
          return meal.id == mealId;
        }));
      });
    }
  }

  bool _isFavorite(String mealId) {
    return _favoritesMeals.any((meal) {
      return meal.id == mealId;
    });
  }

  void setFilters(Map<String, bool> filterData) {
    setState(() {
      _filters = filterData;
      _meals = DUMMY_MEALS.where((meal) {
        if (_filters['gluten'] && !meal.isGlutenFree) {
          return false;
        }
        if (_filters['lactose'] && !meal.isLactoseFree) {
          return false;
        }
        if (_filters['vegan'] && !meal.isVegan) {
          return false;
        }
        if (_filters['vegetarian'] && !meal.isVegetarian) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
              body1: TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
              body2: TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
              title: TextStyle(
                fontSize: 20,
                fontFamily: 'RobotoCondesed',
                fontWeight: FontWeight.bold,
              ),
            ),
      ),
      initialRoute: '/',
      onUnknownRoute: (route) {
        return MaterialPageRoute(builder: (builder) {
          return TabsScreen(_favoritesMeals);
        });
      },
      routes: {
        '/': (ctx) => TabsScreen(_favoritesMeals),
        CategoryMealsScreen.routeName: (ctx) => CategoryMealsScreen(_meals),
        MealScreen.routeName: (ctx) => MealScreen(_isFavorite, _togaleFavorite),
        FiltersScreen.routeName: (ctx) => FiltersScreen(_filters, setFilters),
      },
    );
  }
}
