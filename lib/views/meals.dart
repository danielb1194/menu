import 'package:flutter/material.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/providers/filters.dart';
import 'package:meals/views/filters.dart';
import 'package:meals/views/meal_details.dart';
import 'package:meals/widgets/meal_list_item.dart';
import 'package:provider/provider.dart';

class MealsView extends StatelessWidget {
  const MealsView({super.key, required this.title, required this.meals});

  final List<Meal> meals;
  final String title;

  @override
  Widget build(BuildContext context) {
    final state = context.watch<FiltersProvider>();

    final _filteredMeals = meals.where((m) {
      final filters = state.activeFilters;

      if ((filters[FilterTypes.gluten]! && !m.isGlutenFree) ||
          (filters[FilterTypes.lactose]! && !m.isLactoseFree) ||
          (filters[FilterTypes.vegan]! && !m.isVegan) ||
          (filters[FilterTypes.vegetarian]! && !m.isVegetarian)) {
        return false;
      }
      return true;
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        actions: [
          IconButton(
            icon: const Icon(Icons.filter_list),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const FiltersView(),
                ),
              );
            },
          ),
        ],
      ),
      body: ListView(
        children: [
          for (final m in _filteredMeals)
            InkWell(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => MealDetailsView(meal: m),
                  ),
                );
              },
              child: MealListItem(meal: m),
            ),
          if (_filteredMeals.isEmpty)
            Center(
              child: Text(
                'No meals found...',
                style: const TextStyle().copyWith(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[600]),
              ),
            ),
        ],
      ),
    );
  }
}
