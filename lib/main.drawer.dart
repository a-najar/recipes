import 'package:flutter/material.dart';
import 'package:recipes/filters/filters.screen.dart';

class MainDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
              height: 150,
              width: double.infinity,
              padding: EdgeInsets.all(25),
              alignment: Alignment.centerLeft,
              color: Theme.of(context).accentColor,
              child: Text(
                'Cooking Up!',
                style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 30,
                  color: Theme.of(context).primaryColor,
                ),
              )),
          SizedBox(
            height: 20,
          ),
          buildListTile(Icons.restaurant, "Meals", () {
            Navigator.of(context).pushReplacementNamed('/');
          }),
          buildListTile(Icons.settings, "Settings", () {
            Navigator.of(context).pushReplacementNamed(FiltersScreen.routeName);
          })
        ],
      ),
    );
  }

  Widget buildListTile(IconData icon, String title, Function onTab) {
    return ListTile(
      onTap: onTab,
      leading: Icon(
        icon,
        size: 26,
      ),
      title: Text(
        title,
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
