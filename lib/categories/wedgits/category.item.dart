import 'package:flutter/material.dart';
import 'package:recipes/category/category.meals.screen.dart';

class CategoryItem extends StatelessWidget {
  final String id;
  final String title;
  final Color color;

  CategoryItem({Key key, this.title, this.color, this.id}) : super(key: key);

  void selectCategory(BuildContext context) {
    Navigator.of(context).pushNamed(CategoryMealsScreen.routeName, arguments: {
      'id': id,
      'title': title,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5),
      child: InkWell(
        onTap: () {
          selectCategory(context);
        },
        splashColor: Theme.of(context).primaryColor,
        borderRadius: BorderRadius.circular(15),
        child: Container(
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                color.withOpacity(0.7),
                color,
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Text(
            title,
            style: Theme.of(context).textTheme.title,
          ),
        ),
      ),
    );
  }
}
