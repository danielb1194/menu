import 'package:flutter/material.dart';
import 'package:meals/providers/favorite_meals.dart';
import 'package:meals/views/meal_details.dart';
import 'package:meals/widgets/meal_list_item.dart';
import 'package:provider/provider.dart';

class FavoritesView extends StatelessWidget {
  const FavoritesView({super.key});

  @override
  Widget build(BuildContext context) {
    final state = context.watch<FavoriteMealProvider>();
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            for (final m in state.favoriteMeals)
              InkWell(
                onTap: () {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) => MealDetailsView(meal: m),
                    ),
                  );
                },
                child: MealListItem(meal: m),
              ),
            if (state.favoriteMeals.isEmpty)
              Column(
                children: [
                  const SizedBox(
                    height: 16,
                  ),
                  Center(
                    child: Text(
                      'No favorites yet!',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                ],
              )
          ],
        ),
      ),
    );
  }
}
