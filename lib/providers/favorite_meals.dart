import 'package:flutter/material.dart';
import 'package:meals/data/dummy_data.dart';
import 'package:meals/models/meal.dart';

class FavoriteMealProvider with ChangeNotifier {
  final List<Meal> _favoriteMeals = [dummyMeals.first];

  List<Meal> get favoriteMeals => _favoriteMeals;

  void addFavoriteMeal(
    Meal meal, {
    BuildContext? context,
    bool notify = true,
  }) {
    _favoriteMeals.add(meal);
    if (notify && context != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('${meal.title} added to favorites'),
          duration: const Duration(seconds: 1),
        ),
      );
    }
    notifyListeners();
  }

  void removeFavoriteMeal(
    Meal meal, {
    BuildContext? context,
    bool notify = true,
  }) {
    _favoriteMeals.remove(meal);
    if (notify && context != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('${meal.title} removed from favorites'),
          duration: const Duration(seconds: 1),
        ),
      );
    }
    notifyListeners();
  }

  bool isFavoriteMeal(Meal meal) {
    return _favoriteMeals.contains(meal);
  }
}
