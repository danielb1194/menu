import 'package:flutter/material.dart';
import 'package:meals/views/categories.dart';
import 'package:meals/views/favorites.dart';
import 'package:meals/widgets/drawer.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  int _tabIndex = 0;
  String _activeTabTitle = 'Categories';
  Widget _activeTab = const CategoriesView();

  void _changeTab(int value) {
    setState(() {
      _tabIndex = value;
      if (_tabIndex == 1) {
        _activeTabTitle = 'Favorites';
        _activeTab = const FavoritesView();
      } else {
        _activeTabTitle = 'Categories';
        _activeTab = const CategoriesView();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_activeTabTitle),
      ),
      drawer: const MainDrawer(),
      body: _activeTab,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _tabIndex,
        onTap: (value) => _changeTab(value),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.set_meal),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorites',
          ),
        ],
      ),
    );
  }
}
