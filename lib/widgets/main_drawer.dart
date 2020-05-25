import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/screens/filters_screen.dart';

class MainDrawer extends StatelessWidget {
  Widget buildListTile(IconData icon, String text, Function onTapHandler) {
    return ListTile(
      leading: Icon(
        icon,
        size: 26,
      ),
      title: Text(
        text,
        style: TextStyle(
            fontFamily: 'RobotoCondensed',
            fontSize: 24,
            fontWeight: FontWeight.bold),
      ),
      onTap: onTapHandler,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            alignment: Alignment.centerLeft,
            height: 120,
            padding: EdgeInsets.all(20),
            width: double.infinity,
            child: Text(
              'Bruh?',
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w900,
                  color: Theme.of(context).primaryColor),
            ),
            color: Theme.of(context).accentColor,
          ),
          SizedBox(
            height: 20,
          ),
          buildListTile(Icons.restaurant, 'Meals!', () {
            Navigator.of(context).pushNamed('/');
          }),
          buildListTile(Icons.settings, 'Filters', () {
            Navigator.of(context).pushReplacementNamed(FiltersScreen.routeName);
          }),
        ],
      ),
    );
  }
}
