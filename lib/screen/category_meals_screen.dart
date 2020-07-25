import 'package:dailymiles/models/meal.dart';
import 'package:dailymiles/widgets/meal_data.dart';
import 'package:flutter/material.dart';

class CategoryMealScreen extends StatefulWidget {
  static const routeName = '/categoies-meals';

  final List<Meal> availableMeals;

  CategoryMealScreen(this.availableMeals);

  @override
  _CategoryMealScreenState createState()=>
      _CategoryMealScreenState (
      );
}

class _CategoryMealScreenState extends State<CategoryMealScreen> {
  String categoryTitle;
  List<Meal> displayedMeal;
  var _loadedInitData = false;


  @override
  void didChangeDependencies(){
    if ( !_loadedInitData ) {
      final routeArgs =
      ModalRoute
          .of (
          context )
          .settings
          .arguments as Map<String , String>;
      categoryTitle = routeArgs['title'];
      final categoryId = routeArgs['id'];
      displayedMeal = widget.availableMeals.where (
              (meal){
            return meal.categories.contains(categoryId);
          }).toList();
      _loadedInitData = true;
    }
    super.didChangeDependencies (
    );
  }

  void _removeMeal(String mealId){
    setState (
            (){
          displayedMeal.removeWhere (
                  (meal)=> meal.id == mealId );
        } );
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text(
          categoryTitle,
          style: Theme.of(context).textTheme.title,
        ),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            id: displayedMeal[index].id ,
            title: displayedMeal[index].title ,
            imageUrl: displayedMeal[index].imageUrl ,
            duration: displayedMeal[index].duration ,
            affordability: displayedMeal[index].affordability ,
            complexity: displayedMeal[index].complexity ,
          );
        },
        itemCount: displayedMeal.length ,
      ),
    );
  }
}
