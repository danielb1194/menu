import 'package:flutter/material.dart';
import 'package:meals/providers/filters.dart';
import 'package:provider/provider.dart';

class FiltersView extends StatelessWidget {
  const FiltersView({super.key});

  @override
  Widget build(BuildContext context) {
    final state = context.watch<FiltersProvider>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Filters'),
      ),
      body: Column(
        children: [
          SwitchListTile(
            value: state.activeFilters[FilterTypes.gluten]!,
            onChanged: (value) => state.toggleFilter(FilterTypes.gluten),
            title: const Text('Gluten-free'),
          ),
          SwitchListTile(
            value: state.activeFilters[FilterTypes.lactose]!,
            onChanged: (value) => state.toggleFilter(FilterTypes.lactose),
            title: const Text('Lactose-free'),
          ),
          SwitchListTile(
            value: state.activeFilters[FilterTypes.vegan]!,
            onChanged: (value) => state.toggleFilter(FilterTypes.vegan),
            title: const Text('Vegan'),
          ),
          SwitchListTile(
            value: state.activeFilters[FilterTypes.vegetarian]!,
            onChanged: (value) => state.toggleFilter(FilterTypes.vegetarian),
            title: const Text('Vegetarian'),
          ),
        ],
      ),
    );
  }
}
