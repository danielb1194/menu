import 'package:flutter/material.dart';
import 'package:meals/providers/favorite_meals.dart';
import 'package:meals/widgets/favorites_icon.dart';
import 'package:provider/provider.dart';
import 'package:transparent_image/transparent_image.dart';

import '../models/meal.dart';

class MealListItem extends StatelessWidget {
  const MealListItem({
    required this.meal,
    super.key,
  });

  final Meal meal;

  @override
  Widget build(BuildContext context) {
    final subtitleTextStyle = Theme.of(context)
        .textTheme
        .bodyMedium!
        .copyWith(color: Colors.white.withOpacity(0.6));

    final state = context.watch<FavoriteMealProvider>();
    final isFavorite = state.isFavoriteMeal(meal);

    return Card(
      elevation: 3,
      clipBehavior: Clip.hardEdge,
      margin: const EdgeInsets.all(10),
      child: Stack(
        children: [
          Hero(
            tag: meal.id,
            child: FadeInImage(
              placeholder: MemoryImage(kTransparentImage),
              image: NetworkImage(meal.imageUrl),
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              width: double.infinity,
              color: Colors.black.withOpacity(0.6),
              child: ListTile(
                title: Text(
                  meal.title,
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      fontWeight: FontWeight.bold, color: Colors.white),
                ),
                subtitle: Row(
                  children: [
                    Icon(
                      Icons.shuffle_sharp,
                      color: Colors.white.withOpacity(0.8),
                      size: 15,
                    ),
                    Text(meal.complexity.name, style: subtitleTextStyle),
                    const SizedBox(width: 8),
                    Icon(
                      Icons.timer_outlined,
                      color: Colors.white.withOpacity(0.8),
                      size: 15,
                    ),
                    Text('${meal.duration} min', style: subtitleTextStyle),
                    const SizedBox(width: 8),
                    Icon(
                      Icons.attach_money_sharp,
                      color: Colors.white.withOpacity(0.8),
                      size: 15,
                    ),
                    Text(meal.affordability.name, style: subtitleTextStyle),
                  ],
                ),
                trailing: IconButton(
                  onPressed: () {
                    if (isFavorite) {
                      state.removeFavoriteMeal(meal, context: context);
                    } else {
                      state.addFavoriteMeal(meal, context: context);
                    }
                  },
                  icon: FavoritesIcon(isFavorite: isFavorite, meal: meal),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
