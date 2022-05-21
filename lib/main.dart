import 'package:dhaaba/screens/category_meal_page.dart';
import 'package:dhaaba/screens/meal_detail_page.dart';
import 'package:flutter/material.dart';

import 'package:dhaaba/screens/category_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.pink,
          primaryColor: Colors.pink,
          canvasColor: const Color.fromRGBO(255, 254, 229, 1),
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
        // home: const CatergoryPage(),
        initialRoute: '/',
        routes: {
          '/': (context) => const CatergoryPage(),
          CategoryMealPage.routeName: (context) => const CategoryMealPage(),
          MealDetailPage.routeName: (context) => const MealDetailPage(),
        });
  }
}
