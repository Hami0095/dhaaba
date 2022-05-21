import 'package:dhaaba/dummy_data.dart';
import 'package:flutter/material.dart';

class CategoryMealPage extends StatelessWidget {
  // final String id;
  // final String title;
  static const routeName = '/category-meals';

  const CategoryMealPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    final String? categoryTitle = routeArgs['title'];
    final String? categoryId = routeArgs['id'];
    final categoryMeals = DUMMY_MEALS.where((meal) {
      return meal.categories.contains(categoryId);
    }).toList();
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle!),
      ),
      body: const Center(
        child: Text('The recipies of the meals'),
      ),
    );
  }
}
