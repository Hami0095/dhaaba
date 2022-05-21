import 'package:dhaaba/dummy_data.dart';
import 'package:flutter/material.dart';

import '../widgets/meal_item.dart';

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
      body: ListView.builder(
        itemBuilder: ((ctx, index) {
          return MealItem(
            id: categoryMeals[index].id,
            title: categoryMeals[index].title,
            affordability: categoryMeals[index].affordability,
            complexity: categoryMeals[index].complexity,
            duration: categoryMeals[index].duration,
            imageUrl: categoryMeals[index].imageUrl,
          );
        }),
        itemCount: categoryMeals.length,
      ),
    );
  }
}
