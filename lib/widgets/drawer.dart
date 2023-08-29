import 'package:flutter/material.dart';

import 'package:meals/data/dummy_data.dart';
import 'package:meals/views/filters.dart';
import 'package:meals/views/meals.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    // final state = context.watch<FavoriteMealProvider>();

    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
            margin: EdgeInsets.zero,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
            ),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.restaurant,
                  size: 30,
                ),
                SizedBox(width: 16),
                Text(
                  'Let\'s Cook!',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            leading: const Icon(Icons.restaurant_menu),
            title: const Text('Meals'),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) =>
                      MealsView(meals: dummyMeals, title: 'All Meals'),
                ),
              );
            },
          ),
          // ListTile(
          //   leading: const Icon(Icons.favorite),
          //   title: const Text('Favorites'),
          //   onTap: () {
          //     Navigator.of(context).push(
          //       MaterialPageRoute(
          //         builder: (context) => const FavoritesView(),
          //       ),
          //     );
          //   },
          // ),
          ListTile(
            leading: const Icon(Icons.filter_alt_sharp),
            title: const Text('Filters'),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const FiltersView(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
