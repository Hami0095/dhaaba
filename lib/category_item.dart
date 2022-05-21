import 'package:flutter/material.dart';

import 'package:dhaaba/category_meal_page.dart';

// ignore: must_be_immutable
class CategoryItem extends StatelessWidget {
  String title;
  String id;
  Color color;
  CategoryItem({
    Key? key,
    required this.title,
    required this.id,
    required this.color,
  }) : super(key: key);

  void selectCategory(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(
      '/category-meals',
      arguments: {'id': id, 'title': title},
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectCategory(context),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        //margin: const EdgeInsets.all(5),
        padding: const EdgeInsets.all(15),
        child: Text(
          title,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              color.withOpacity(0.7),
              color,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(16),
        ),
      ),
    );
  }
}
