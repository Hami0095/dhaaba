import 'package:dhaaba/screens/meal_detail_page.dart';
import 'package:flutter/material.dart';

import 'package:dhaaba/models/meals.dart';

class MealItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;

  const MealItem({
    Key? key,
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.duration,
    required this.complexity,
    required this.affordability,
  }) : super(key: key);

  // ignore: non_constant_identifier_names
  String get complexityText {
    if (complexity == Complexity.Simple) {
      return 'Simple';
    } else if (complexity == Complexity.Hard) {
      return 'Hard';
    } else if (complexity == Complexity.Challenging) {
      return 'Challenging';
    } else {
      return 'Unkown';
    }
  }

  String get affordabilityText {
    if (affordability == Affordability.Affordable) {
      return 'Affordable';
    } else if (affordability == Affordability.Pricey) {
      return 'Pricey';
    } else if (affordability == Affordability.Luxurious) {
      return 'Luxurious';
    } else {
      return 'Unkown';
    }
  }

  void selectMeal(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(MealDetailPage.routeName, arguments: id);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectMeal(context),
      child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          elevation: 4,
          margin: const EdgeInsets.all(8),
          child: Column(
            children: [
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15),
                    ),
                    child: Image.network(
                      imageUrl,
                      height: 250,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    child: Container(
                      width: 300,
                      decoration: const BoxDecoration(
                        color: Colors.black54,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                        ),
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 5,
                      ),
                      child: Text(
                        title,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                        softWrap: true,
                        overflow: TextOverflow.fade,
                      ),
                    ),
                    bottom: 20,
                    right: 10,
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      children: [
                        const Icon(Icons.schedule),
                        const SizedBox(width: 10),
                        Text('$duration min')
                      ],
                    ),
                    Row(
                      children: [
                        const Icon(Icons.work),
                        const SizedBox(width: 10),
                        Text(complexityText)
                      ],
                    ),
                    Row(
                      children: [
                        const Icon(Icons.attach_money),
                        const SizedBox(width: 1),
                        Text(affordabilityText),
                      ],
                    ),
                  ],
                ),
              )
            ],
          )),
    );
  }
}
