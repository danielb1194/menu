import 'package:flutter/material.dart';

enum FilterTypes {
  gluten,
  lactose,
  vegan,
  vegetarian,
}

class FiltersProvider extends ChangeNotifier {
  final Map<FilterTypes, bool> activeFilters = {
    FilterTypes.gluten: false,
    FilterTypes.lactose: false,
    FilterTypes.vegan: false,
    FilterTypes.vegetarian: false,
  };

  Map<FilterTypes, bool> get filterBy => activeFilters;

  void toggleFilter(FilterTypes key) {
    activeFilters[key] = !activeFilters[key]!;
    notifyListeners();
  }
}
