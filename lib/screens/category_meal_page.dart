import 'package:flutter/material.dart';

import 'package:dhaaba/dummy_data.dart';
import 'package:dhaaba/models/meals.dart';

import '../widgets/meal_item.dart';

class CategoryMealPage extends StatefulWidget {
  List<Meal> meals;
  static const routeName = '/category-meals';

  CategoryMealPage({
    Key? key,
    required this.meals,
  }) : super(key: key);

  @override
  State<CategoryMealPage> createState() => _CategoryMealPageState();
}

class _CategoryMealPageState extends State<CategoryMealPage> {
  late String? categoryTitle;
  late List<Meal> displayedMeals;
  var _loadedDataInit = false;
  @override
  void didChangeDependencies() {
    if (!_loadedDataInit) {
      final routeArgs =
          ModalRoute.of(context)!.settings.arguments as Map<String, String>;
      categoryTitle = routeArgs['title'];
      final String? categoryId = routeArgs['id'];
      displayedMeals = widget.meals.where((meal) {
        return meal.categories.contains(categoryId);
      }).toList();
      _loadedDataInit = true;
    }
    super.didChangeDependencies();
  }

  void _removeMeal(String mealId) {
    setState(
      () {
        displayedMeals.removeWhere(
          (element) => element.id == mealId,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle!),
      ),
      body: ListView.builder(
        itemBuilder: ((ctx, index) {
          return MealItem(
            id: displayedMeals[index].id,
            title: displayedMeals[index].title,
            affordability: displayedMeals[index].affordability,
            complexity: displayedMeals[index].complexity,
            duration: displayedMeals[index].duration,
            imageUrl: displayedMeals[index].imageUrl,
          );
        }),
        itemCount: displayedMeals.length,
      ),
    );
  }
}
