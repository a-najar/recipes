import 'package:flutter/material.dart';
import 'package:recipes/data/dummy.data.dart';

class MealScreen extends StatelessWidget {
  static const routeName = '/meal';
  final Function togleFavorite;
  final Function isFavorite;

  MealScreen(this.isFavorite, this.togleFavorite);

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context).settings.arguments as String;

    final selectedMeal = DUMMY_MEALS.firstWhere((meal) {
      return meal.id == mealId;
    });

    return Scaffold(
      appBar: AppBar(
        title: Text(selectedMeal.title),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              buildImage(selectedMeal.imageUrl),
              buildSectionTitle(context, 'Ingrediants'),
              buildContainer(
                  buildIngredientsList(context, selectedMeal.ingredients)),
              buildSectionTitle(context, 'Steps'),
              buildContainer(buildStepsList(context, selectedMeal.steps)),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          togleFavorite(mealId);
        },
        child: Icon(
          isFavorite(mealId) ? Icons.star : Icons.star_border,
          color: Colors.white,
        ),
      ),
    );
  }

  Widget buildImage(imageUrl) {
    return Container(
      height: 300,
      width: double.infinity,
      child: Image.network(
        imageUrl,
        fit: BoxFit.cover,
      ),
    );
  }

  Widget buildSectionTitle(BuildContext context, String text) {
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: 16,
      ),
      child: Text(
        text,
        style: Theme.of(context).textTheme.title,
      ),
    );
  }

  Widget buildIngredientsList(BuildContext context, List<String> ingredients) {
    return ListView.builder(
      itemBuilder: (ctx, index) {
        return Card(
            elevation: 0,
            color: Theme.of(context).accentColor,
            child: Container(
              padding: EdgeInsets.all(10),
              child: Text(ingredients[index],
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                  )),
            ));
      },
      itemCount: ingredients.length,
    );
  }

  Widget buildStepsList(BuildContext context, List<String> list) {
    return ListView.builder(
        itemCount: list.length,
        itemBuilder: (ctx, index) {
          return Column(
            children: <Widget>[
              ListTile(
                leading: CircleAvatar(
                  child: Text("${index + 1}"),
                ),
                title: Text(
                  list[index],
                ),
              ),
              Divider(
                height: 1,
                color: Colors.grey,
              )
            ],
          );
        });
  }

  Widget buildContainer(Widget child) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: Colors.grey,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      width: 300,
      height: 200,
      child: child,
    );
  }
}
