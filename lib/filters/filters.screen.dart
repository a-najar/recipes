import 'package:flutter/material.dart';
import 'package:recipes/main.drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = '/filters';
  final Map<String, bool> currentFilter;
  final Function saveFilters;

  FiltersScreen(this.currentFilter, this.saveFilters);

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _glutenFree = false;
  bool _vegetarian = false;
  bool _vegan = false;
  bool _lactoseFree = false;

  @override
  void initState() {
    _glutenFree = widget.currentFilter['gluten'];
    _vegetarian = widget.currentFilter['vegetarian'];
    _vegan = widget.currentFilter['vegan'];
    _lactoseFree = widget.currentFilter['lactose'];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MainDrawer(),
      appBar: AppBar(
        title: Text('Filters'),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.save),
              onPressed: () {
                widget.saveFilters({
                  'gluten': _glutenFree,
                  'lactose': _lactoseFree,
                  'vegan': _vegan,
                  'vegetarian': _vegetarian,
                });
              })
        ],
      ),
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              'Adjust your meal selection',
              style: Theme.of(context).textTheme.title,
            ),
          ),
          Expanded(
              child: ListView(
            children: <Widget>[
              _buildSwitchListTile(
                  title: 'Gluten-free',
                  subtitle: 'Only include Gluten-free meals',
                  currentValue: _glutenFree,
                  onChange: (onChange) {
                    setState(() {
                      _glutenFree = onChange;
                    });
                  }),
              _buildSwitchListTile(
                  title: 'Lactose-free',
                  subtitle: 'Only include Lactose-free meals',
                  currentValue: _lactoseFree,
                  onChange: (onChange) {
                    setState(() {
                      _lactoseFree = onChange;
                    });
                  }),
              _buildSwitchListTile(
                  title: 'Vegetarian',
                  subtitle: 'Only include vegetarian meals',
                  currentValue: _vegetarian,
                  onChange: (onChange) {
                    setState(() {
                      _vegetarian = onChange;
                    });
                  }),
              _buildSwitchListTile(
                  title: 'Vegan',
                  subtitle: 'Only include Vegan meals',
                  currentValue: _vegan,
                  onChange: (onChange) {
                    setState(() {
                      _vegan = onChange;
                    });
                  })
            ],
          ))
        ],
      ),
    );
  }

  Widget _buildSwitchListTile({
    @required String title,
    @required String subtitle,
    @required bool currentValue,
    @required Function onChange,
  }) {
    return SwitchListTile.adaptive(
      inactiveThumbColor: Colors.grey,
      activeColor: Colors.pink,
      value: currentValue,
      onChanged: onChange,
      title: Text(title),
      subtitle: Text(subtitle),
    );
  }
}
