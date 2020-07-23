import 'package:dailymiles/screen/meal_detail_screen.dart';
import 'package:flutter/material.dart';
import './screen/cateories_screen.dart';
import './screen/category_meals_screen.dart';
import 'screen/tab_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'DeliMeals',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        accentColor: Colors.grey,
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
        '/': (ctx) =>TabScreen(),
        CategoryMealScreen.routeName: (ctx) =>CategoryMealScreen(),
        MealDetailScreen.routeName: (ctx) => MealDetailScreen()
      },
      onUnknownRoute: (settings){
        return MaterialPageRoute(builder: (ctx)=> CategoryMealScreen());
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
