import 'package:flutter/material.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/providers/favorite_meals.dart';
import 'package:meals/widgets/favorites_icon.dart';
import 'package:provider/provider.dart';

class MealDetailsView extends StatelessWidget {
  const MealDetailsView({super.key, required this.meal});

  final Meal meal;

  @override
  Widget build(BuildContext context) {
    final state = context.watch<FavoriteMealProvider>();
    final isFavorite = state.isFavoriteMeal(meal);

    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
        actions: [
          IconButton(
            onPressed: () {
              if (isFavorite) {
                state.removeFavoriteMeal(meal, context: context);
              } else {
                state.addFavoriteMeal(meal, context: context);
              }
            },
            icon: FavoritesIcon(meal: meal, isFavorite: isFavorite),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Hero(
                tag: meal.id,
                child: Card(
                  clipBehavior: Clip.hardEdge,
                  child: Image.network(meal.imageUrl),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Text('Ingredients',
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .copyWith(color: Colors.orangeAccent)),
              for (final i in meal.ingredients)
                Padding(
                  padding: const EdgeInsets.fromLTRB(8, 8, 0, 0),
                  child: Text("→  $i",
                      style: Theme.of(context).textTheme.bodyMedium),
                ),
              const SizedBox(
                height: 16,
              ),
              Text('Steps',
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .copyWith(color: Colors.orangeAccent)),
              for (final s in meal.steps)
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('→  $s',
                      style: Theme.of(context).textTheme.bodyMedium),
                ),
              const SizedBox(
                height: 16,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
