import 'package:flutter/material.dart';
import 'package:news/Home/tabs/tabsWidget.dart';
import 'package:news/api/apiManger.dart';
import 'package:news/appColors.dart';
import 'package:news/model/source_response/source_response.dart';

class Homescreen extends StatefulWidget {

static const  String routeName ='homeScreen';
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
            body: FutureBuilder<SourceResponse?>(
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
                            onPressed: () {Apimanger.getSources();
                            setState(() {
                              
                            });}, child: Text('try again'))
                      ],
                    );
                  }
                  if (snapshot.data!.status != 'ok') {
                    return Column(
                      children: [
                        Text('Something went wrong',),
                        ElevatedButton(
                            onPressed: () {
                              Apimanger.getSources();
                            setState(() {
                              
                            });}, child: Text('try again'))
                      ],
                    );
                  }
                  var sourceList =snapshot.data!.sources;
                  return Tabswidget(sourceList: sourceList!);
                }))
      ],
    );
  }
}
