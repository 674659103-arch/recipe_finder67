import 'package:flutter/material.dart';
import 'screens/login.dart';
import 'screens/home.dart';
import 'screens/categories.dart';
import 'screens/community_recipes.dart';
import 'screens/recipe_detail.dart';
import 'screens/favorites.dart';
import 'screens/meal_planner.dart';
import 'screens/profile.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Recipe Finder',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF157128),
          primary: const Color(0xFF157128),
        ),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const LoginScreen(),
        '/home': (context) => const HomeScreen(),
        '/categories': (context) => const CategoriesScreen(),
        '/community_recipes': (context) => const CommunityRecipesScreen(),
        '/recipe_detail': (context) => const RecipeDetailScreen(),
        '/favorites': (context) => const FavoritesScreen(),
        '/meal_planner': (context) => const MealPlannerScreen(),
        '/profile': (context) => const ProfileScreen(),
      },
    );
  }
}

