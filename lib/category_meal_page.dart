import 'package:flutter/material.dart';

class CategoryMealPage extends StatelessWidget {
  final String id;
  final String title;
  const CategoryMealPage({
    Key? key,
    required this.id,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: const Center(
        child: Text('The recipies of the meals'),
      ),
    );
  }
}
