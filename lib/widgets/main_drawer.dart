import 'package:dhaaba/screens/filter_screen.dart';
import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({Key? key}) : super(key: key);

  Widget _buildListTile(IconData? icon, String txt, VoidCallback tapHandler) {
    return ListTile(
      leading: Icon(
        icon,
        size: 26,
      ),
      title: Text(
        txt,
        style: const TextStyle(
          fontSize: 24,
          fontFamily: 'RobotoCondensed',
          fontWeight: FontWeight.bold,
        ),
      ),
      onTap: tapHandler,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        elevation: 1.5,
        child: Column(
          children: [
            Container(
              height: 120,
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              alignment: Alignment.centerLeft,
              color: Theme.of(context).primaryColorLight,
              child: Text(
                'Cooking Up!',
                style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 26,
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            _buildListTile(
              Icons.restaurant,
              'Meals',
              () {
                Navigator.of(context).pushReplacementNamed('/');
              },
            ),
            const Divider(),
            _buildListTile(
              Icons.settings,
              'Filter',
              () {
                Navigator.of(context)
                    .pushReplacementNamed(FilterScreen.routeName);
              },
            ),
            const Divider(),
          ],
        ),
      ),
    );
  }
}
