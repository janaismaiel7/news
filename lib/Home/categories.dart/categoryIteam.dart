import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:news/model/category.dart';

class Categoryiteam extends StatelessWidget {

  Categoryy category;
  int index;

  Categoryiteam({required this.category, required this.index});
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: category.color,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(25),
          topLeft: Radius.circular(25),
          bottomLeft: Radius.circular(index % 2 == 0 ? 25 : 0),
          bottomRight: Radius.circular(index % 2 == 0 ? 25 : 0),
        ),
      ),
      child: Column(
        children: [Expanded(child: Image.asset(category.imagePath)), 
        Text(category.title)],
      ),
    );
  }
}
