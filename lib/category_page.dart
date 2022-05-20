import 'package:dhaaba/category_item.dart';
import 'package:flutter/material.dart';

import 'dummy_data.dart';

class CatergoriesPage extends StatelessWidget {
  const CatergoriesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView(
      children: DUMMY_CATEGORIES
          .map(
            (e) => CategoryItem(color: e.color, title: e.title),
          )
          .toList(),
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,
        childAspectRatio: 1.5,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      ),
    );
  }
}
