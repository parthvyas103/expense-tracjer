import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = '/filters';
  final Function _saveFilters;
  final Map<String, bool> leFilters;

  FiltersScreen(this._saveFilters, this.leFilters);

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  var _isGlutenFree = false;
  var _isLactoseFree = false;
  var _isVegan = false;
  var _isVegetarian = false;

  @override
  initState() {
    _isVegetarian = widget.leFilters['vegetarian'];
    _isGlutenFree = widget.leFilters['gluten'];
    _isVegan = widget.leFilters['vegan'];
    _isLactoseFree = widget.leFilters['lactose'];
    super.initState();
  }

  Widget _buildSwitchListTile(
      String title, String desc, bool currentValue, Function updateValue) {
    return SwitchListTile(
      title: Text(title),
      value: currentValue,
      onChanged: updateValue,
      subtitle: Text(desc),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Filters Screen'),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.save),
              onPressed: () {
                final selectedFilters = {
                  'gluten': _isGlutenFree,
                  'lactose': _isLactoseFree,
                  'vegan': _isVegan,
                  'vegetarian': _isVegetarian
                };
                widget._saveFilters(selectedFilters);
              },
            )
          ],
        ),
        drawer: MainDrawer(),
        body: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(20),
              child: Text(
                'Adjust your dietary preferences',
                style: Theme.of(context).textTheme.title,
              ),
            ),
            Expanded(
              child: ListView(
                children: <Widget>[
                  _buildSwitchListTile(
                      'Gluten-Free?', 'For meals without Gluten', _isGlutenFree,
                      (updatedvalue) {
                    setState(() {
                      _isGlutenFree = updatedvalue;
                    });
                  }),
                  _buildSwitchListTile(
                      'Lactose-Free?',
                      'Filter out meals containing Lactose',
                      _isLactoseFree, (updatedvalue) {
                    setState(() {
                      _isLactoseFree = updatedvalue;
                    });
                  }),
                  _buildSwitchListTile(
                      'Vegan?', 'For Vegan meals only', _isVegan,
                      (updatedvalue) {
                    setState(() {
                      _isVegan = updatedvalue;
                    });
                  }),
                  _buildSwitchListTile(
                      'Vegetarian?', 'For vegetarian meals only', _isVegetarian,
                      (updatedvalue) {
                    setState(() {
                      _isVegetarian = updatedvalue;
                    });
                  })
                ],
              ),
            )
          ],
        ));
  }
}
