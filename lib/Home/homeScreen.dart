import 'package:flutter/material.dart';
import 'package:news/Home/Search/searchView.dart';
import 'package:news/Home/Settings.dart/SettingsTab.dart';
import 'package:news/Home/categories.dart/categoryDetails.dart';
import 'package:news/Home/categories.dart/categoryFragment.dart';
import 'package:news/Home/drawer/homeDrawer.dart';
import 'package:news/api/apiManger.dart';
import 'package:news/appColors.dart';
import 'package:news/model/category.dart';
import 'package:news/model/news_response/article.dart';

class Homescreen extends StatefulWidget {
  static const String routeName = 'homeScreen';
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  String? searchTerm;
  bool isSearching = false;
  TextEditingController searchController = TextEditingController();
  List<News> searchResults = [];
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
          appBar: isSearching
              ? AppBar(
                  iconTheme: IconThemeData(color: Appcolors.whiteColor),
                  leading: IconButton(
                    onPressed: () {
                      setState(() {
                        isSearching = false;
                        searchTerm = null;
                        searchController.clear();
                        searchResults = [];
                      });
                    },
                    icon: Icon(Icons.clear, size: 35),
                  ),
                  title: TextField(
                    style: TextStyle(color: Appcolors.primaryColor),
                    controller: searchController,
                    decoration: InputDecoration(
                      hintText: 'Search',
                      hintStyle: TextStyle(color: Appcolors.primaryColor),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                      fillColor: Colors.white,
                      filled: true,
                    ),
                    onChanged: (value) {
                      if (value.isNotEmpty) {
                        searchQuery(value, selectedCategory!.id!);
                      }
                    },
                  ),
                )
              : AppBar(
                  iconTheme: IconThemeData(color: Appcolors.whiteColor),
                  title: Text(
                    selectedMenuIteam == Homedrawer.settings
                        ? 'Settings'
                        : selectedCategory == null
                            ? 'News App'
                            : selectedCategory!.title,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  actions: [
                    if (selectedCategory != null)
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal:
                                MediaQuery.of(context).size.width * 0.05),
                        child: IconButton(
                          onPressed: () {
                            isSearching = true;
                            setState(() {});
                          },
                          icon: Icon(
                            Icons.search,
                          ),
                          iconSize: 35,
                        ),
                      )
                  ],
                ),
          drawer: Drawer(
            child: Homedrawer(onSideMenuClick: onSideMenuClick),
          ),
          body: isSearching
              ? buildSearchResults()
              : selectedMenuIteam == Homedrawer.settings
                  ? Settingstab()
                  : selectedCategory == null
                      ? categoryfargment(
                          onCategoryIteamClick: onCategoryIteamClick)
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

  void searchQuery(String query, String categoryId) async {
    var searchList = await Apimanger.searchList(query);
    setState(() {
      searchResults = searchList;
    });
  }

  Widget buildSearchResults() {
    return Column(
      children: [
        Expanded(
          child: searchResults.isEmpty
              ? Center(
                  child: Text('No results found',
                      style: TextStyle(color: Colors.white)))
              : ListView.builder(
                  padding: const EdgeInsets.all(20),
                  itemCount: searchResults.length,
                  itemBuilder: (context, index) {
                    final result = searchResults[index];
                    return Searchview(result: result);
                  },
                ),
        ),
      ],
    );
  }
}
