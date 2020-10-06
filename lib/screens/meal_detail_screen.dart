import 'package:flutter/material.dart';
import 'package:meals_app/data/dummy_data.dart';
import 'package:meals_app/settings_state.dart';

import 'package:provider/provider.dart';

class MealDetailScreen extends StatefulWidget {
  static final routeName = '/meal-detail';

  @override
  _MealDetailScreenState createState() => _MealDetailScreenState();
}

class _MealDetailScreenState extends State<MealDetailScreen> {
  Widget _buildTitle(BuildContext context, String title) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 15),
      child: Text(
        title,
        style: Theme.of(context).textTheme.headline6,
      ),
    );
  }

  Widget _buildContainer({Widget child}) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.green),
          borderRadius: BorderRadius.circular(10)),
      height: 150,
      width: 300,
      child: child,
    );
  }

  var isFavorite = false;

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context).settings.arguments as String;
    isFavorite =
        Provider.of<SettingState>(context, listen: true).isMealFavorite(mealId);
    final selectedMeal =
        DUMMY_MEALS.firstWhere((element) => element.id == mealId);
    return Scaffold(
      appBar: AppBar(
        title: Text('${selectedMeal.title}'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 200,
              width: double.infinity,
              child: Image.network(
                selectedMeal.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            _buildTitle(context, 'Ingredients'),
            _buildContainer(
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      color: Theme.of(context).accentColor,
                      child: Text(selectedMeal.ingredients[index]),
                    ),
                  );
                },
                itemCount: selectedMeal.ingredients.length,
              ),
            ),
            _buildTitle(context, 'Steps'),
            _buildContainer(
                child: ListView.builder(
              itemBuilder: (context, index) {
                return ListTile(
                  leading: CircleAvatar(
                    child: Text('${index + 1}.'),
                  ),
                  title: Text(selectedMeal.steps[index]),
                );
              },
              itemCount: selectedMeal.steps.length,
            ))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Provider.of<SettingState>(context, listen: false)
                .toggleFavorite(mealId);
          },
          child: isFavorite ? Icon(Icons.star) : Icon(Icons.star_border)),
    );
  }
}
