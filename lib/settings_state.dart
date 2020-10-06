import 'package:flutter/cupertino.dart';
import 'package:meals_app/data/dummy_data.dart';

import 'model/meal.dart';

class SettingState with ChangeNotifier {
  Map<String, bool> switchValues = {
    'gluten-free': false,
    'vegetarian': false,
    'vegan': false,
    'lactose-free': false,
  };
  List<Meal> availableMeals = DUMMY_MEALS;

  void changeState(var selectedFilters) {
    switchValues = selectedFilters;
    availableMeals = DUMMY_MEALS.where((meal) {
      if (switchValues['gluten-free'] && !meal.isGlutenFree) {
        return false;
      }
      if (switchValues['vegetarian'] && !meal.isVegetarian) {
        return false;
      }
      if (switchValues['vegan'] && !meal.isVegan) {
        return false;
      }
      if (switchValues['lactose-free'] && !meal.isLactoseFree) {
        return false;
      }
      return true;
    }).toList();
    notifyListeners();
  }

  Map<String, bool> get states {
    return switchValues;
  }

  List<Meal> favoriteMeals = [];

  bool toggleFavorite(String mealId) {
    final existingIndex =
        favoriteMeals.indexWhere((element) => element.id == mealId);
    if (existingIndex >= 0) {
      favoriteMeals.removeAt(existingIndex);
    } else {
      favoriteMeals
          .add(availableMeals.firstWhere((element) => element.id == mealId));
    }
    notifyListeners();

    return isMealFavorite(mealId);
  }

  bool isMealFavorite(String id) {
    var value = favoriteMeals.any((meal) => meal.id == id);
    return value;
  }
}
