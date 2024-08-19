import 'package:flutter/material.dart';
import 'package:news/Home/news/newIteam.dart';
import 'package:news/api/apiManger.dart';
import 'package:news/appColors.dart';
import 'package:news/model/news_response/article.dart';
import 'package:news/model/news_response/news_response.dart';
import 'package:news/model/source_response/source.dart';

class Newswidget extends StatefulWidget {
  final Source source;

  Newswidget({required this.source});

  @override
  State<Newswidget> createState() => _NewswidgetState();
}

class _NewswidgetState extends State<Newswidget> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<NewsResponse?>(
      future: Apimanger.getNewsBySourceId(widget.source.id ?? ''),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(
              color: Appcolors.primaryColor,
            ),
          );
        } else if (snapshot.hasError) {
          return Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('Something went wrong'),
                ElevatedButton(
                  onPressed: () {
                    setState(() {});
                  },
                  child: Text('Try Again'),
                ),
              ],
            ),
          );
        } else if (snapshot.hasData && snapshot.data!.status == 'ok') {
          var newsList = snapshot.data!.articles;
          return ListView.builder(
            itemCount: newsList?.length ?? 0,  
            itemBuilder: (context, index) {
              var article = newsList?[index];
              return Newiteam(news: newsList![index]);
            },
          );
        } else {
          return Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('Something went wrong'),
                ElevatedButton(
                  onPressed: () {
                    setState(() {});
                  },
                  child: Text('Try Again'),
                ),
              ],
            ),
          );
        }
      },
    );
  }
}
