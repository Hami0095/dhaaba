import 'package:flutter/material.dart';

class CategoryMealPage extends StatelessWidget {
  // final String id;
  // final String title;
  const CategoryMealPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    final String? argTitle = routeArgs['title'];
    final String? argId = routeArgs['id'];
    return Scaffold(
      appBar: AppBar(
        title: Text(argTitle!),
      ),
      body: const Center(
        child: Text('The recipies of the meals'),
      ),
    );
  }
}
