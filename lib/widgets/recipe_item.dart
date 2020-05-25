import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/models/meal.dart';
import 'package:flutter_complete_guide/screens/recipe_item_screen.dart';

class RecipeItem extends StatefulWidget {
  final String title;
  final String imageurl;
  final Complexity complexity;
  final Affordability affordability;
  final int duration;
  final String id;

  RecipeItem({
    @required this.title,
    @required this.affordability,
    @required this.imageurl,
    @required this.complexity,
    @required this.duration,
    @required this.id,
  });

  @override
  _RecipeItemState createState() => _RecipeItemState();
}

class _RecipeItemState extends State<RecipeItem> {
  String get complexityText {
    switch (widget.complexity) {
      case Complexity.Simple:
        return 'Simple';
        break;
      case Complexity.Challenging:
        return 'Challenging';
        break;
      case Complexity.Hard:
        return 'Hard';
        break;
      default:
        return 'Invalid';
    }
  }

  String get affordabilityText {
    switch (widget.affordability) {
      case Affordability.Affordable:
        return 'Affordable';
        break;
      case Affordability.Pricey:
        return 'Pricey';
        break;
      case Affordability.Luxurious:
        return 'Luxurious';
        break;
      default:
        return 'Invalid';
    }
  }

  void displayRecipe(BuildContext context) {
    Navigator.of(context).pushNamed(RecipeItemScreen.routeName,
        arguments: {'id': widget.id}).then((result) {
      if (result != null) {
        /* widget.removeItem(result);*/
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => displayRecipe(context),
      child: Card(
        elevation: 4,
        margin: EdgeInsets.all(10),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                ClipRRect(
                  child: Image.network(
                    widget.imageurl,
                    fit: BoxFit.cover,
                    width: double.infinity,
                  ),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15)),
                ),
                Positioned(
                  bottom: 20,
                  right: 10,
                  child: Container(
                    width: 300,
                    color: Colors.black54,
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                    child: Text(
                      widget.title,
                      style: TextStyle(fontSize: 20, color: Colors.white),
                      softWrap: true,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                ),
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
                      Text('${widget.duration} min')
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
                      Text(complexityText)
                    ],
                  ),
                  Row(children: <Widget>[
                    Icon(
                      Icons.attach_money,
                    ),
                    SizedBox(
                      width: 6,
                    ),
                    Text(affordabilityText)
                  ])
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
