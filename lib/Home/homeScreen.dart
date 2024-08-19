import 'package:flutter/material.dart';
import 'package:news/Home/categories.dart/categoryDetails.dart';
import 'package:news/Home/categories.dart/categoryFragment.dart';
import 'package:news/Home/tabs/tabsWidget.dart';
import 'package:news/api/apiManger.dart';
import 'package:news/appColors.dart';
import 'package:news/model/source_response/source_response.dart';

class Homescreen extends StatefulWidget {
  static const String routeName = 'homeScreen';
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
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
                'News App',
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
            body:categoryfargment()
          )
      ],
    );
  }
}
