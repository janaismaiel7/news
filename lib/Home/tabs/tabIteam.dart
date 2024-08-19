import 'package:flutter/material.dart';
import 'package:news/appColors.dart';
import 'package:news/model/source_response/source.dart';

class Tabiteam extends StatelessWidget {
  bool isSelected;
  Source source;
  Tabiteam({required this.isSelected, required this.source});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Appcolors.primaryColor, width: 2),
          color: isSelected ? Appcolors.primaryColor : Colors.transparent),
      child: Text(source.name ?? '',
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
              color:
                  isSelected ? Appcolors.whiteColor : Appcolors.primaryColor)),
    );
  }
}
