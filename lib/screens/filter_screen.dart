import 'package:flutter/material.dart';

import 'package:dhaaba/widgets/main_drawer.dart';

class FilterScreen extends StatefulWidget {
  const FilterScreen({
    Key? key,
    required this.savefilters,
    required this.filter,
  }) : super(key: key);
  static const routeName = '/filters';
  final Function savefilters;
  final Map<String, bool> filter;

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  bool? _glutenFree = false;
  bool? _vegetarian = false;
  bool? _vegan = false;
  bool? _lactoseFree = false;

  @override
  initState() {
    _glutenFree = widget.filter['gluten'];
    super.initState();
  }

  Widget _buildSwitchListTile(
    bool val,
    String txt,
    String title,
    Function(bool) changedValue,
  ) {
    return SwitchListTile(
      title: Text(title),
      value: val,
      onChanged: changedValue,
      subtitle: Text('Only include ${txt} meals'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Filters'),
      ),
      drawer: const MainDrawer(),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            child: Text(
              'Adjust your meal selection',
              style: Theme.of(context).textTheme.subtitle1,
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                _buildSwitchListTile(
                  _glutenFree!,
                  'Gluten Free',
                  'Gluten-Free',
                  (value) {
                    setState(() {
                      _glutenFree = value;
                    });
                  },
                ),
                const Divider(),
                _buildSwitchListTile(
                  _vegetarian!,
                  'Vegetarian',
                  'Vegeterian',
                  (value) {
                    setState(() {
                      _vegetarian = value;
                    });
                  },
                ),
                const Divider(),
                _buildSwitchListTile(
                  _vegan!,
                  'Vegan',
                  'Vegan',
                  (value) {
                    setState(() {
                      _vegan = value;
                    });
                  },
                ),
                const Divider(),
                _buildSwitchListTile(
                  _lactoseFree!,
                  'Lactose Free',
                  'Lactose-Free',
                  (value) {
                    setState(() {
                      _lactoseFree = value;
                    });
                  },
                )
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final selectedFilters = {
            'gluten': _glutenFree,
            'lactose': _lactoseFree,
            'vegan': _vegan,
            'vegetarian': _vegetarian,
          };
          widget.savefilters(selectedFilters);
        },
        child: const Icon(
          Icons.save,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
