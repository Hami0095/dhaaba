import 'package:flutter/material.dart';

class MealDetailPage extends StatelessWidget {
  static const routeName = '/meal-detail';
  const MealDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('The Meal!'),
    );
  }
}
