import 'package:flutter/material.dart';

import 'package:dhaaba/screens/category_page.dart';
import 'package:dhaaba/screens/favourites_page.dart';
import 'package:dhaaba/widgets/main_drawer.dart';

import '../models/meals.dart';

class TabsPage extends StatefulWidget {
  List<Meal> favMeals;
  TabsPage({
    Key? key,
    required this.favMeals,
  }) : super(key: key);

  @override
  State<TabsPage> createState() => _TabsPageState();
}

class _TabsPageState extends State<TabsPage> {
  late List<Map<String, Object>> _pages;
  int _selectedIndex = 0;
  void _selectPage(int index) {
    setState(() {
      _selectedIndex = index;
      print(_selectedIndex);
    });
  }

  @override
  void initState() {
    _pages = [
      {'pages': const CatergoryPage(), 'title': 'Categories'},
      {
        'pages': FavouritesPage(meals: widget.favMeals),
        'title': 'My Favourites'
      },
    ];
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        foregroundColor: Colors.white,
        title: Text(
          _pages[_selectedIndex]['title'].toString(),
        ),
      ),
      drawer: const MainDrawer(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _selectPage,
        // backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Color.fromARGB(255, 157, 0, 84),
        selectedItemColor: Colors.white,
        type: BottomNavigationBarType.shifting,
        items: [
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: const Icon(Icons.category),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: const Icon(Icons.star),
            label: 'Favourites',
          ),
        ],
      ),
      body: _pages[_selectedIndex]['pages'] as Widget,
    );
  }
}
