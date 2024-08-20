import 'package:flutter/material.dart';
import 'package:news/appColors.dart';

class Categoryy {
  String id;
  String title;
  String imagePath;
  Color color;

  Categoryy({required this.color,required this.imagePath,required this.id,required this.title});

  static List<Categoryy> getCategories(){
    return [
      Categoryy(color: Appcolors.redColor, imagePath: "assets/images/ball.png", id: "sports", title: "sports"),
      Categoryy(color: Appcolors.darkBlueColor, imagePath: "assets/images/environment.png", id: "general", title: "general"),
      Categoryy(color: Appcolors.pinkColor, imagePath: "assets/images/health.png", id: 'health', title: "health"),
      Categoryy(color: Appcolors.lightBrownColor, imagePath: "assets/images/bussines.png", id: 'business', title: "business"),
     Categoryy(color: Appcolors.blueColor, imagePath: "assets/images/environment.png", id: 'entertainment', title: "entertainment"),
      Categoryy(color: Appcolors.yellowColor, imagePath: "assets/images/science.png", id: 'science', title: "science"),
       Categoryy(color: Appcolors.darkBlueColor, imagePath: "assets/images/science.png", id: 'technology', title: "technology"),
    ];
  }
}