import 'package:flutter/material.dart';
import 'package:meals_app/settings_state.dart';
import 'package:meals_app/widgets/main_drawer.dart';
import 'package:provider/provider.dart';

class SettingsScreen extends StatefulWidget {
  static const routeName = '/settings';

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  var _glutenFree = false;
  var _vegetarian = false;
  var _vegan = false;
  var _lactoseFree = false;
  @override
  void initState() {
    super.initState();
  }

  void currentSettings() {
    final states = Provider.of<SettingState>(context).states;
    _glutenFree = states['gluten-free'];
    _vegetarian = states['vegetarian'];
    _vegan = states['vegan'];
    _lactoseFree = states['lactose-free'];
  }

  @override
  void didChangeDependencies() {
    currentSettings();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Settings'),
          actions: [
            IconButton(
                icon: Icon(Icons.save),
                onPressed: () {
                  final selectedFilters = {
                    'gluten-free': _glutenFree,
                    'vegetarian': _vegetarian,
                    'vegan': _vegan,
                    'lactose-free': _lactoseFree,
                  };
                  Provider.of<SettingState>(context, listen: false)
                      .changeState(selectedFilters);
                })
          ],
        ),
        drawer: MainDrawer(),
        body: Column(
          children: [
            Container(
              padding: EdgeInsets.all(20),
              child: Text(
                'Adjust your meal selection',
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
            Expanded(
              child: ListView(
                children: [
                  _buildSwitchListTile(
                    title: 'Gluten-Free',
                    description: 'Only include gluten-free meals',
                    currentValue: _glutenFree,
                    updateValue: (newValue) {
                      {
                        setState(() {
                          _glutenFree = newValue;
                        });
                      }
                    },
                  ),
                  _buildSwitchListTile(
                      title: 'Vegetarian',
                      description: 'Only include Vegetarian meals',
                      currentValue: _vegetarian,
                      updateValue: (newValue) {
                        setState(() {
                          _vegetarian = newValue;
                        });
                      }),
                  _buildSwitchListTile(
                      title: 'Vegan',
                      description: 'Only include Vegan meals',
                      currentValue: _vegan,
                      updateValue: (newValue) {
                        setState(() {
                          _vegan = newValue;
                        });
                      }),
                  _buildSwitchListTile(
                      title: 'Lactose-Free',
                      description: 'Only include Lactose-Free meals',
                      currentValue: _lactoseFree,
                      updateValue: (newValue) {
                        setState(() {
                          _lactoseFree = newValue;
                        });
                      }),
                ],
              ),
            )
          ],
        ));
  }

  SwitchListTile _buildSwitchListTile(
      {String title,
      String description,
      bool currentValue,
      Function updateValue}) {
    return SwitchListTile(
        title: Text(title),
        value: currentValue,
        subtitle: Text(description),
        onChanged: updateValue);
  }
}
