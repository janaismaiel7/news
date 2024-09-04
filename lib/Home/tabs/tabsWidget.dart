import 'package:flutter/material.dart';
import 'package:news/Home/news/newsWidget.dart';
import 'package:news/Home/tabs/tabIteam.dart';
import 'package:news/model/source_response/source.dart';

class Tabswidget extends StatefulWidget {
  List<Source> sourceList;

  Tabswidget({required this.sourceList});

  @override
  State<Tabswidget> createState() => _TabswidgetState();
}

class _TabswidgetState extends State<Tabswidget> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: widget.sourceList.length,
        child: Column(
          children: [
            TabBar(
                onTap: (index) {
                  selectedIndex = index;
                  setState(() {});
                },
                isScrollable: true,
                indicatorColor: Colors.transparent,
                dividerColor: Colors.transparent,
                tabs: widget.sourceList
                    .map((source) => Tabiteam(
                        isSelected:
                            selectedIndex == widget.sourceList.indexOf(source),
                        source: source))
                    .toList()),
            Expanded(
                child: Newswidget(source: widget.sourceList[selectedIndex]))
          ],
        ));
  }
}
