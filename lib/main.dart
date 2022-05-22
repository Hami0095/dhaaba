import 'package:flutter/material.dart';

import './dummy_data.dart';
import './screens/category_meal_page.dart';
import './screens/filter_screen.dart';
import './screens/meal_detail_page.dart';
import './screens/tabs_page.dart';
import './models/meals.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  Map<String, bool?> _filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false,
  };
  List<Meal> availableMeals = DUMMY_MEALS;
  List<Meal> favouriteMeals = [];
  void _setFilters(Map<String, bool?> filterData) {
    setState(() {
      _filters = filterData;
      availableMeals = DUMMY_MEALS.where(
        (meal) {
          if (_filters['gluten'] == true && !meal.isGlutenFree) {
            return false;
          }
          if (_filters['lactose'] == true && !meal.isLactoseFree) {
            return false;
          }
          if (_filters['vegan'] == true && !meal.isVegan) {
            return false;
          }
          if (_filters['vegetarian'] == true && !meal.isVegetarian) {
            return false;
          }
          return true;
        },
      ).toList();
    });
  }

  void _toggleFavourite(String mealId) {
    final existingIndex =
        favouriteMeals.indexWhere((meal) => meal.id == mealId);
    if (existingIndex >= 0) {
      setState(() {
        favouriteMeals.removeAt(existingIndex);
      });
    } else {
      setState(() {
        favouriteMeals
            .add(DUMMY_MEALS.firstWhere((element) => element.id == mealId));
      });
    }
  }

  bool isFavourite(String id) {
    return favouriteMeals.any((element) => element.id == id);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.pink,
          primaryColor: Colors.pink,
          canvasColor: const Color.fromARGB(255, 248, 240, 245),
          fontFamily: 'Raleway',
          textTheme: ThemeData.light().textTheme.copyWith(
                bodyText1: const TextStyle(
                  color: Color.fromRGBO(20, 51, 51, 1),
                ),
                bodyText2: const TextStyle(
                  color: Color.fromRGBO(20, 51, 51, 1),
                ),
                subtitle1: const TextStyle(
                  fontSize: 20,
                  fontFamily: 'RobotoCondensed',
                  fontWeight: FontWeight.bold,
                ),
              ),
        ),
        // home: const TabsPage(),
        initialRoute: '/',
        routes: {
          '/': (context) => TabsPage(favMeals: favouriteMeals),
          CategoryMealPage.routeName: (context) =>
              CategoryMealPage(meals: availableMeals),
          MealDetailPage.routeName: (context) => MealDetailPage(
                favFunc: _toggleFavourite,
                isFav: isFavourite,
              ),
          FilterScreen.routeName: (context) => FilterScreen(
                filter: _filters,
                savefilters: _setFilters,
              ),
        });
  }
}
