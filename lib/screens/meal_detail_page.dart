import 'dart:math';

import 'package:dhaaba/dummy_data.dart';
import 'package:flutter/material.dart';

class MealDetailPage extends StatelessWidget {
  static const routeName = '/meal-detail';

  MealDetailPage({Key? key}) : super(key: key);

  final colorsRndm = const [
    Color.fromARGB(255, 255, 247, 7),
    Colors.pinkAccent,
    Color.fromARGB(255, 77, 175, 224),
    Color.fromARGB(255, 17, 224, 151),
    Color.fromARGB(255, 136, 234, 7),
    Color.fromARGB(255, 234, 7, 189),
    Color.fromARGB(255, 234, 155, 7),
  ];
  Widget buildContainer(Widget child) {
    return Container(
      height: 150,
      width: 300,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.circular(15),
      ),
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      child: child,
    );
  }

  Widget buildTitle(BuildContext context, String text) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Text(
        text,
        style: Theme.of(context).textTheme.subtitle1,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context)!.settings.arguments as String;
    final selectedMeal = DUMMY_MEALS.firstWhere((meal) => meal.id == mealId);
    return Scaffold(
      appBar: AppBar(
        title: Text('${selectedMeal.title}'),
      ),
      body: Column(
        children: [
          Container(
            height: 300,
            margin: const EdgeInsets.all(10),
            // padding: const EdgeInsets.all(20),

            width: double.infinity,
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(15),
                bottomRight: Radius.circular(20),
              ),
              child: Image.network(selectedMeal.imageUrl, fit: BoxFit.cover),
            ),
          ),
          buildTitle(context, 'Ingredients'),
          buildContainer(
            ListView.builder(
              itemBuilder: (context, index) => Card(
                color: colorsRndm[Random().nextInt(5)],
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 5.0, horizontal: 10.0),
                  child: Text(selectedMeal.ingredients[index]),
                ),
              ),
              itemCount: selectedMeal.ingredients.length,
            ),
          ),
          buildTitle(context, 'Steps'),
          buildContainer(
            ListView.builder(
              itemBuilder: (ctx, index) => Column(
                children: [
                  ListTile(
                    leading: CircleAvatar(
                      child: Text('# ${index + 1}'),
                    ),
                    title: Text(
                      selectedMeal.steps[index],
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                  ),
                  const Divider(),
                ],
              ),
              itemCount: selectedMeal.steps.length,
            ),
          ),
        ],
      ),
    );
  }
}
