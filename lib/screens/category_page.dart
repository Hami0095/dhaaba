import 'package:dhaaba/widgets/category_item.dart';
import 'package:flutter/material.dart';

import '../dummy_data.dart';

class CatergoryPage extends StatelessWidget {
  const CatergoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: const EdgeInsets.all(15),
      children: DUMMY_CATEGORIES
          .map(
            (e) => CategoryItem(color: e.color, title: e.title, id: e.id),
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
