import 'package:flutter/material.dart';

import '../dummy_data.dart';
import '../widgets/category_item.dart';

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
//      appBar: AppBar(
//        title: Text('DeliMeal',style: Theme.of(context).textTheme.title,),
//      ),
      body: Padding(

        padding: const EdgeInsets.all(10.0),
        child: GridView(
          children: DUMMY_CATEGORIES.map(
                (catData) => CategoryItem(
                  catData.title,
                  catData.color,
                  catData.id
                ),).toList(),

          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            childAspectRatio: 3 / 3 ,
            mainAxisSpacing: 10 ,
            crossAxisSpacing: 10 ,
          ),
        ),
      ),
    );
  }
}
