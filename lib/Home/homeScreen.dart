import 'package:flutter/material.dart';
import 'package:news/Home/Settings.dart/SettingsTab.dart';
import 'package:news/Home/categories.dart/categoryDetails.dart';
import 'package:news/Home/categories.dart/categoryFragment.dart';
import 'package:news/Home/drawer/homeDrawer.dart';
import 'package:news/appColors.dart';
import 'package:news/model/category.dart';

class Homescreen extends StatefulWidget {
  static const String routeName = 'homeScreen';
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  Categoryy? selectedCategory;
  int selectedMenuIteam = Homedrawer.categories;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: Appcolors.whiteColor,
          child: Image.asset(
            'assets/images/pattern.png',
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
          ),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            title: Text(
              selectedMenuIteam == Homedrawer.settings
                  ? 'Settings'
                  : selectedCategory == null
                      ? 'News App'
                      : selectedCategory!.title,
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          drawer: Drawer(
            child: Homedrawer(onSideMenuClick: onSideMenuClick),
          ),
          body: selectedMenuIteam == Homedrawer.settings
              ? Settingstab()
              : selectedCategory == null
                  ? categoryfargment(onCategoryIteamClick: onCategoryIteamClick)
                  : Categorydetails(categoryy: selectedCategory!),
        ),
      ],
    );
  }

  void onCategoryIteamClick(Categoryy newCategory) {
    selectedCategory = newCategory;
    selectedMenuIteam = Homedrawer.categories; 
    setState(() {});
  }

  void onSideMenuClick(int newSIdeMEnuIteam) {
    selectedMenuIteam = newSIdeMEnuIteam;
    selectedCategory = null;
    Navigator.pop(context); 
    setState(() {});
  }
}
