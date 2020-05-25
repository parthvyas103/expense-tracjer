import 'package:flutter/material.dart';
import '../categories.dart';

class RecipeItemScreen extends StatefulWidget {
  static const routeName = '/recipe-item-screen';
  Function toggleFavourite;
  Function isFavourite;
  RecipeItemScreen(this.toggleFavourite, this.isFavourite);

  @override
  _RecipeItemScreenState createState() => _RecipeItemScreenState();
}

class _RecipeItemScreenState extends State<RecipeItemScreen> {
  Widget buildSectionTitle(BuildContext context, String text) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Text(
        text,
        style: Theme.of(context).textTheme.title,
      ),
    );
  }

  Widget buildContainer(Widget child) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
      ),
      height: 150,
      width: 300,
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.all(10),
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final id = ModalRoute.of(context).settings.arguments as String;
    final meal = DUMMY_MEALS.firstWhere((mealus) => mealus.id == id);
    return Scaffold(
      appBar: AppBar(
        title: Text('${meal.title}'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(
                meal.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            buildSectionTitle(context, 'Ingredients!'),
            buildContainer(
              ListView.builder(
                itemBuilder: (ctx, index) {
                  return Padding(
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    child: Card(
                      child: Text('${meal.ingredients[index]}'),
                      color: Theme.of(context).accentColor,
                    ),
                  );
                },
                itemCount: meal.ingredients.length,
              ),
            ),
            buildSectionTitle(context, 'Steps!'),
            buildContainer(ListView.builder(
              itemBuilder: (context, index) => ListTile(
                leading: CircleAvatar(
                  child: Text("#${(index + 1)}"),
                ),
                title: Text(meal.steps[index]),
              ),
              itemCount: meal.steps.length,
            ))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          child: !widget.isFavourite(id)
              ? Icon(Icons.star)
              : Icon(Icons.star_border),
          onPressed: () => widget.toggleFavourite(id)),
    );
  }
}
