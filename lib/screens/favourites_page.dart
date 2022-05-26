import 'package:flutter/material.dart';

import '../models/meals.dart';
import '../widgets/meal_item.dart';

class FavouritesPage extends StatelessWidget {
  final List<Meal> meals;
  const FavouritesPage({
    Key? key,
    required this.meals,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (meals.isEmpty) {
      return Container(
        child: Center(
          child: Text(
            'NO FAVOURITES ADDED YET',
            style: TextStyle(
              color: Theme.of(context).primaryColor,
            ),
          ),
        ),
      );
    } else {
      return ListView.builder(
        itemBuilder: ((ctx, index) {
          return MealItem(
            id: meals[index].id,
            title: meals[index].title,
            affordability: meals[index].affordability,
            complexity: meals[index].complexity,
            duration: meals[index].duration,
            imageUrl: meals[index].imageUrl,
          );
        }),
        itemCount: meals.length,
      );
    }
  }
}
