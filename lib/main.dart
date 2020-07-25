import 'package:dailymiles/dummy_data.dart';
import 'package:dailymiles/screen/filter_screen.dart';
import 'package:dailymiles/screen/meal_detail_screen.dart';
import 'package:flutter/material.dart';

import './screen/category_meals_screen.dart';
import 'models/meal.dart';
import 'screen/tab_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState()=>
      _MyAppState (
      );
}

class _MyAppState extends State<MyApp> {
  Map<String , bool> _filters = {
    'gluten': false ,
    'lactose': false ,
    'vegan': false ,
    'vegetarian': false ,
  };
  List<Meal> _favoriteMeals = [];

  List<Meal> _availableMeals = DUMMY_MEALS;

  void _setFilters(Map<String , bool> filterData){
    setState (
            (){
          _filters = filterData;
          _availableMeals = DUMMY_MEALS.where (
                  (meal){
                if ( _filters['gluten'] && !meal.isGlutenFree ) {
                  return false;
                }
                if ( _filters['lactose'] && !meal.isLactoseFree ) {
                  return false;
                }
                if ( _filters['vegan'] && !meal.isVegan ) {
                  return false;
                }
                if ( _filters['vegetarian'] && !meal.isVegetarian ) {
                  return false;
                }
                return true;
              } ).toList (
          );
        } );
  }

  void _togelFavorite(String mealId){
    final existingIndex = _favoriteMeals.indexWhere (
            (meal)=> meal.id == mealId );
    if ( existingIndex >= 0 ) {
      setState (
              (){
            _favoriteMeals.removeAt (
                existingIndex );
          } );
    } else
    {
      setState (
              (){
            _favoriteMeals.add (
                DUMMY_MEALS.firstWhere (
                        (meal)=> meal.id == mealId ) );
          } );
    }
  }

  bool _isMealFavorite(String id){
    return _favoriteMeals.any (
            (meal)=> meal.id == id );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'DeliMeals',
      theme: ThemeData(
          primarySwatch: Colors.blue,
          accentColor: Colors.red ,
          canvasColor: Colors.lightBlueAccent,
          fontFamily: 'Raleway',
          textTheme: ThemeData.light().textTheme.copyWith(
              body1: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              body2: TextStyle(
                  color: Color.fromRGBO(20, 51, 51, 1)
              ),
              title: TextStyle(
                fontSize: 20,
                fontWeight:FontWeight.bold,
                fontFamily: 'RobotoCondensed',
              )
          )
      ),
      routes:{
        '/': (ctx)=>
            TabScreen (
                _favoriteMeals ) ,
        CategoryMealScreen.routeName: (ctx)=>
            CategoryMealScreen (
                _availableMeals ) ,
        MealDetailScreen.routeName: (ctx)=>
            MealDetailScreen (
                _togelFavorite , _isMealFavorite ) ,
        FilterScreen.routeName: (ctx)=>
            FilterScreen (
                _filters , _setFilters ) ,

      },
      onUnknownRoute: (settings){
        return MaterialPageRoute (
            builder: (ctx)=>
                CategoryMealScreen (
                    _availableMeals ) );
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Meals',
          style: Theme.of(context).textTheme.title.copyWith(fontSize: 30),),
      ),
      body: Center(
        child: Text('Navigation Time!'),
      ),
    );
  }
}




