import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:meals/providers/favorite_meals.dart';
import 'package:meals/providers/filters.dart';
import 'package:meals/views/main_view.dart';
import 'package:provider/provider.dart';

final theme = ThemeData(
  useMaterial3: true,
  colorScheme: const ColorScheme.dark().copyWith(
    brightness: Brightness.dark,
  ),
  textTheme: GoogleFonts.latoTextTheme().copyWith().apply(
        bodyColor: Colors.white,
        displayColor: Colors.white,
      ),
);

// reducer

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => FavoriteMealProvider()),
        ChangeNotifierProvider(create: (_) => FiltersProvider()),
      ],
      child: const App(),
    ),
  );
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: theme,
      home: const MainView(),
    );
  }
}
