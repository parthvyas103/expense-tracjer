import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/screens/categories_screen.dart';
import 'package:flutter_complete_guide/screens/favourite_meals.dart';
import 'package:flutter_complete_guide/widgets/main_drawer.dart';
import 'package:flutter_complete_guide/models/meal.dart';

class TabsScreen extends StatefulWidget {
  List<Meal> favouriteMeals;
  TabsScreen(this.favouriteMeals);

  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  List<Widget> _pages;
  int _selectedPageIndex = 0;

  @override
  void initState() {
    // TODO: implement initState
    _pages = [CategoriesScreen(), FavouriteScreen(widget.favouriteMeals)];
    super.initState();
  }

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Le Meals"),
      ),
      body: _pages[_selectedPageIndex],
      drawer: MainDrawer(),
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        backgroundColor: Theme.of(context).primaryColor,
        selectedItemColor: Theme.of(context).accentColor,
        unselectedItemColor: Colors.white,
        currentIndex: _selectedPageIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            title: Text('Categories'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            title: Text('Favourites'),
          ),
        ],
      ),
    );
  }
}
