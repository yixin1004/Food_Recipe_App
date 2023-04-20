///import relevant package
import 'package:flutter/material.dart';
import 'package:food_recipes/components/components.dart';
import 'package:food_recipes/models/meal_model.dart';
import 'package:food_recipes/modules/category_meal_screen.dart';
import 'package:food_recipes/modules/filters_screen.dart';
import 'package:food_recipes/modules/home_screen.dart';
import 'package:food_recipes/modules/meal_details_screen.dart';
import 'package:food_recipes/modules/on_boarding_screen.dart';
import 'package:introduction_screen/introduction_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<MealModel> favorites = [];

  List<PageViewModel> getOnBoarding() {
    return [
      PageViewModel(
          title: 'First, we eat. Then, we do everything else',
          body:
              'Despite what psychologists say, it’s totally okay to replace love with food',
          image: const Image(
              image: NetworkImage(
                  'https://img.freepik.com/free-photo/tortilla-wrap-with-falafel-fresh-salad-vegan-tacos-vegetarian-healthy-food-top-view_2829-6197.jpg?size=338&ext=jpg'))),
      PageViewModel(
          title: 'Good food, good mood.',
          body:
              'Whenever you see me seemingly thinking deep thoughts, I’m probably just thinking about food.',
          image: const Image(
              image: NetworkImage(
                  'https://image.freepik.com/free-photo/vegetarian-falafel-with-vegetables-tzatziki-sauce-tortilla-bread-dark-wooden-background-top-view-copy-space_89816-28026.jpg'))),
      PageViewModel(
          title: 'If the fries is right, then we have a deal!',
          body:
              'We are lucky that we don’t have to venture into the wild and hunt for food anymore',
          image: const Image(
              image: NetworkImage(
                  'https://image.freepik.com/free-photo/pizza-time-tasty-homemade-traditional-pizza-italian-recipe_144627-42528.jpg'))),
    ];
  }
  ///This is a function called toggleFavorites that takes a mealId as an argument.
  void toggleFavorits(String mealId) {
    ///It searches for an existing meal with the given mealId in a list called favorites using the indexWhere method. The indexWhere method returns the index of the first element that satisfies the given condition, which in this case is checking if the id of the meal matches the mealId.
    final existingMeal = favorites.indexWhere((meal) => meal.id == mealId);
    ///If an existing meal is found (i.e., existingMeal is greater than or equal to 0), then it removes the meal from the favorites list using the removeAt method.
    if (existingMeal >= 0) {
      setState(() {
        favorites.removeAt(existingMeal);
      });
    ///If no existing meal is found (i.e., existingMeal is less than 0), then it adds a new meal to the favorites list using the add method. The new meal is obtained by searching for the first meal in a list called MEALRecipes that has a matching id to the given mealId.
    } else {
      setState(() {
        favorites.add(MEALRecipes.firstWhere((meal) => meal.id == mealId));
      });
    }
  }
///The any method returns a Boolean value indicating whether the condition was satisfied by at least one element in the list. The isFavorites function returns this Boolean value as its own result. If any meal in the favorites list has the same id as the id parameter, the function will return true, otherwise, it will return false.
  bool isFavorites(String id) {
    return favorites.any((meal) => meal.id == id);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          accentColor: thirdColor,
          fontFamily: 'Raleway',
          textTheme: ThemeData.light().textTheme.copyWith(
                subtitle1: const TextStyle(
                  fontFamily: 'Raleway',
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 15,
                ),
              ),
          appBarTheme: AppBarTheme(
            // ignore: deprecated_member_use
            textTheme: ThemeData.light().textTheme.copyWith(
                  subtitle2: const TextStyle(
                    fontFamily: 'Raleway',
                    fontSize: 25,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
          )),
      home: OnBoardingScreen(),
      routes: {
        '/category_meal': (context) => CategoryMealScreen(),
        '/meal_details': (context) =>
            MealDetailsScreen(toggleFavorits, isFavorites),
        '/filter': (context) => FilterScreen(),
        '/home': (context) => HomeScreen(favorites),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
