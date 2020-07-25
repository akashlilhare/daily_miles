import 'package:dailymiles/models/meal.dart';
import 'package:dailymiles/screen/cateories_screen.dart';
import 'package:dailymiles/screen/favorites_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Drawer.dart';

class TabScreen extends StatefulWidget {
  final List<Meal> favoriteMeals;

  TabScreen(this.favoriteMeals);

  @override
  _TabScreenState createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  List<Map<String , Object>> _pages;


  int _selectPageIndex = 0;

  @override
  void initState(){
    _pages = [
      {'page': CategoriesScreen (
      ) , 'title': 'Categories'} ,
      {'page': FavoritesScreen (
          widget.favoriteMeals ) , 'title': 'Your Favorite'} ,
    ];
    super.initState (
    );
  }

  void _selectPage(int index){
    setState (
            (){
          _selectPageIndex = index;
        } );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold (
      appBar: AppBar (
        title: (Text (
            _pages[_selectPageIndex]['title'] )) ,
      ) ,
      drawer: MainDrawer (
      ) ,
      body: _pages[_selectPageIndex]['page'] ,
      bottomNavigationBar: BottomNavigationBar (
        currentIndex: _selectPageIndex ,
        selectedItemColor: Theme
            .of (
            context )
            .accentColor ,
        unselectedItemColor: Colors.white ,
        onTap: _selectPage ,
        backgroundColor: Theme
            .of (
            context )
            .primaryColor ,
        items: [
          BottomNavigationBarItem (
            icon: Icon (
                Icons.category ) ,
            title: Text (
                'Categories' ) ,
          ) ,
          BottomNavigationBarItem (
            icon: Icon (
                Icons.star ) ,
            title: Text (
                'Faveraiot' ) ,
          )
        ] ,
      ),
    );
  }
}
