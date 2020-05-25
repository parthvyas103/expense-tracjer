import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/models/meal.dart';
import 'package:flutter_complete_guide/widgets/recipe_item.dart';
import '../categories.dart';

class RecipeScreen extends StatefulWidget {
  static const routeName = '/recipe-screen';
  List<Meal> gottenMeals;

  RecipeScreen(this.gottenMeals);
  @override
  _RecipeScreenState createState() => _RecipeScreenState();
}

class _RecipeScreenState extends State<RecipeScreen> {
  String categoryTitle;
  List<Meal> displayedMeals;
  var _loadedInitData = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    if (!_loadedInitData) {
      final routeArgs =
          ModalRoute.of(context).settings.arguments as Map<String, String>;
      categoryTitle = routeArgs['title'];
      final categoryid = routeArgs['id'];
      displayedMeals = widget.gottenMeals.where((meal) {
        return meal.categories.contains(categoryid);
      }).toList();
      _loadedInitData = true;
      super.didChangeDependencies();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return RecipeItem(
            id: displayedMeals[index].id,
            title: displayedMeals[index].title,
            affordability: displayedMeals[index].affordability,
            complexity: displayedMeals[index].complexity,
            duration: displayedMeals[index].duration,
            imageurl: displayedMeals[index].imageUrl,
          );
        },
        itemCount: displayedMeals.length,
      ),
    );
  }
}
