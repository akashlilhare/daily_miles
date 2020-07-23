import 'package:flutter/material.dart';

class CategoryMealScreen extends StatelessWidget {
//  final String title;
//  final String id;
//  CategoryMealScreen({@required this.title,@required this.id});
  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final categoryTitle = routeArgs['title'];
    final categoryId = routeArgs['id'];
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
    );
  }
}
