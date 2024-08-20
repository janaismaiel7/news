import 'package:flutter/material.dart';
import 'package:news/appColors.dart';

class Homedrawer extends StatefulWidget {
  static const int categories = 1;
  static const int settings = 2;

  final Function(int) onSideMenuClick;
  Homedrawer({required this.onSideMenuClick});

  @override
  State<Homedrawer> createState() => _HomedrawerState();
}

class _HomedrawerState extends State<Homedrawer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(80.0), // Height of AppBar including padding
          child: AppBar(
            title: Text(
              'News App',
              style: TextStyle(color: Colors.white),
            ),
            centerTitle: true,
          )),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            InkWell(
              onTap: () {
                widget.onSideMenuClick(Homedrawer.categories); // Pass categories identifier
              },
              child: Row(
                children: [
                  Icon(
                    Icons.list,
                    size: 45,
                  ),
                  SizedBox(
                    width: 12,
                  ),
                  Text(
                    'Categories',
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge
                        ?.copyWith(color: Appcolors.blackColor),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20), 
            InkWell(
              onTap: () {
                widget.onSideMenuClick(Homedrawer.settings); 
              },
              child: Row(
                children: [
                  Icon(
                    Icons.settings,
                    size: 45,
                  ),
                  SizedBox(
                    width: 12,
                  ),
                  Text(
                    'Settings',
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge
                        ?.copyWith(color: Appcolors.blackColor),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
