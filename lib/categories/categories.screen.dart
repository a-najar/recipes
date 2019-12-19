import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:recipes/categories/wedgits/category.item.dart';
import 'package:recipes/data/dummy.data.dart';
import 'package:recipes/data/models/category.dart';

class CategoriesScreen extends StatelessWidget {
  final List<Category> items = DUMMY_CATEGORIES;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(25),
      itemCount: items.length,
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 20,
      ),
      itemBuilder: (cxt, index) {
        return CategoryItem(
          key: ValueKey(items[index].id),
          title: items[index].title,
          color: items[index].color,
          id: items[index].id,
        );
      },
    );
  }
}
