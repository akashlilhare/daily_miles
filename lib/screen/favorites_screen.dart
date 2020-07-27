import 'package:dailymiles/models/meal.dart';
import 'package:dailymiles/widgets/meal_data.dart';
import 'package:flutter/material.dart';

class FavoritesScreen extends StatelessWidget {
  static const routeName = '/favorites';
  final List<Meal> favoriteMeals;

  FavoritesScreen(this.favoriteMeals);

  @override
  Widget build(BuildContext context){
    if ( favoriteMeals.isEmpty ) {
      return Center (
        child: Container (
            child: Text (
                'You have no favorites yet - start adding some!' ) ) ,
      );
    }
    else
      return
        ListView.builder (
          itemBuilder: (ctx , index){
            return MealItem (
              id: favoriteMeals[index].id ,
              title: favoriteMeals[index].title ,
              imageUrl: favoriteMeals[index].imageUrl ,
              duration: favoriteMeals[index].duration ,
              affordability: favoriteMeals[index].affordability ,
              complexity: favoriteMeals[index].complexity ,

            );
          } ,
          itemCount: favoriteMeals.length ,
        );
  }
}
