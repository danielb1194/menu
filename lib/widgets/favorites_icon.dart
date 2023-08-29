import 'package:flutter/material.dart';
import 'package:meals/models/meal.dart';

class FavoritesIcon extends StatelessWidget {
  const FavoritesIcon(
      {super.key, required this.meal, required this.isFavorite});

  final Meal meal;
  final bool isFavorite;

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 300),
      child: Icon(
        isFavorite ? Icons.favorite : Icons.favorite_border,
        key: ValueKey(isFavorite),
      ),
      transitionBuilder: (child, animation) => ScaleTransition(
        scale: animation,
        child: child,
      ),
    );
  }
}
