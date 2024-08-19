import 'package:flutter/material.dart';
import 'package:news/Home/tabs/tabsWidget.dart';
import 'package:news/api/apiManger.dart';
import 'package:news/appColors.dart';
import 'package:news/model/source_response/source_response.dart';

class Categorydetails extends StatefulWidget {
  const Categorydetails({super.key});

  @override
  State<Categorydetails> createState() => _CategorydetailsState();
}

class _CategorydetailsState extends State<Categorydetails> {
  @override
  Widget build(BuildContext context) {
    return  FutureBuilder<SourceResponse?>(
                future: Apimanger.getSources(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: CircularProgressIndicator(
                        color: Appcolors.primaryColor,
                      ),
                    );
                  } else if (snapshot.hasError) {
                    return Column(
                      children: [
                        Text('Something went wrong'),
                        ElevatedButton(
                            onPressed: () {
                              Apimanger.getSources();
                              setState(() {});
                            },
                            child: Text('try again'))
                      ],
                    );
                  }
                  if (snapshot.data!.status != 'ok') {
                    return Center(
                      child: Column(
                        children: [
                          Text(
                            'Something went wrong',
                          ),
                          ElevatedButton(
                              onPressed: () {
                                Apimanger.getSources();
                                setState(() {});
                              },
                              child: Text('try again'))
                        ],
                      ),
                    );
                  }
                  var sourceList = snapshot.data!.sources;
                  return Tabswidget(sourceList: sourceList!);
                });
  }
}