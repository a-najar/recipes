import 'package:flutter/material.dart';
import 'package:recipes/meal/meal.screen.dart';

class MealItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;
  final String affordabilityText;
  final String complexityText;
  final int duration;

  MealItem({
    @required this.id,
    @required this.title,
    @required this.imageUrl,
    @required this.affordabilityText,
    @required this.complexityText,
    @required this.duration,
  });

  void selectMeal(BuildContext context) {
    Navigator.of(context).pushNamed(MealScreen.routeName, arguments: id);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        selectMeal(context);
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 4,
        margin: const EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  child: Image.network(
                    imageUrl,
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 20,
                  left: 10,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 20,
                    ),
                    width: 300,
                    color: Theme.of(context).textTheme.title.color,
                    child: Text(
                      title,
                      style: TextStyle(fontSize: 26, color: Colors.white),
                      softWrap: true,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Icon(
                        Icons.schedule,
                      ),
                      SizedBox(
                        width: 6,
                      ),
                      Text(
                        "$duration",
                        style: Theme.of(context).textTheme.title,
                      )
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Icon(
                        Icons.work,
                      ),
                      SizedBox(
                        width: 6,
                      ),
                      Text(
                        "$complexityText",
                        style: Theme.of(context).textTheme.title,
                      )
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Icon(
                        Icons.attach_money,
                      ),
                      SizedBox(
                        width: 6,
                      ),
                      Text(
                        "$affordabilityText",
                        style: Theme.of(context).textTheme.title,
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
