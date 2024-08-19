import 'package:flutter/material.dart';
import 'package:news/Home/categories.dart/categoryIteam.dart';
import 'package:news/model/category.dart';

class categoryfargment extends StatelessWidget {
 var categoriesList = Categoryy.getCategories();
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Pick Your Category \nof interset',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          SizedBox(height: 20,),
          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
              ),
              itemBuilder: (context, index) {
                return Categoryiteam(category: categoriesList[index], 
                index: index);
              },
              itemCount: categoriesList.length,
              
            ),
          )
        ],
      ),
    );
  }
}
