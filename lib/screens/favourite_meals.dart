import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/models/meal.dart';
import 'package:flutter_complete_guide/widgets/recipe_item.dart';

class FavouriteScreen extends StatefulWidget {
  List<Meal> favouriteMeals;
  FavouriteScreen(this.favouriteMeals);

  @override
  _FavouriteScreenState createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  @override
  Widget build(BuildContext context) {
    if (widget.favouriteMeals.isEmpty) {
      return Center(
        child: Text("No favourites yet."),
      );
    } else {
      return ListView.builder(
          itemBuilder: (context, index) {
            return RecipeItem(
              id: widget.favouriteMeals[index].id,
              title: widget.favouriteMeals[index].title,
              affordability: widget.favouriteMeals[index].affordability,
              complexity: widget.favouriteMeals[index].complexity,
              duration: widget.favouriteMeals[index].duration,
              imageurl: widget.favouriteMeals[index].imageUrl,
            );
          },
          itemCount: widget.favouriteMeals.length);
    }
  }
}
