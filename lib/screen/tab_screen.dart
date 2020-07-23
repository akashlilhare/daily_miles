import 'package:dailymiles/screen/cateories_screen.dart';
import 'package:dailymiles/screen/favorites_screen.dart';
import 'package:flutter/material.dart';

class TabScreen extends StatefulWidget {
  @override
  _TabScreenState createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      initialIndex: 1,
      child: Scaffold(
        appBar:AppBar(title: Text('Meals'),
        bottom: TabBar(
          tabs: <Widget>[
            Tab(icon: Icon(
              Icons.category
            ),
            text: 'Categories',
            ),
            Tab(icon: Icon(
                Icons.favorite
            ),
              text: 'favorite',
            ),
          ],
        ),
        ) ,
        body: TabBarView(children: <Widget>[
          CategoriesScreen(),FavoritesScreen()
        ],),
      ),
    );
  }
}
