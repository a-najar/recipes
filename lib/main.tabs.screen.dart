import 'package:flutter/material.dart';
import 'package:recipes/categories/categories.screen.dart';
import 'package:recipes/data/models/Meal.dart';
import 'package:recipes/favorites/favorites.screen.dart';
import 'package:recipes/main.drawer.dart';

class TabsScreen extends StatefulWidget {
  final List<Meal> favoritesMeals;

  TabsScreen(this.favoritesMeals);

  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  List<Map<String, Object>> _pages;

  int _selectedPageIndex = 0;

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  void initState() {
    _pages = [
      {
        'title': 'Categories',
        'page': CategoriesScreen(),
      },
      {
        'title': 'Favorites',
        'page': FavoritesScreen(widget.favoritesMeals),
      }
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MainDrawer(),
      appBar: AppBar(
        title: Text(_pages[_selectedPageIndex]['title']),
      ),
      bottomNavigationBar: BottomNavigationBar(
          unselectedItemColor: Colors.white,
          selectedItemColor: Theme.of(context).accentColor,
          onTap: _selectPage,
          currentIndex: _selectedPageIndex,
          backgroundColor: Theme.of(context).primaryColor,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.category),
              title: Text("Categories"),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.star),
              title: Text("Favorites"),
            ),
          ]),
      body: _pages[_selectedPageIndex]['page'],
    );
  }
}
