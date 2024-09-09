import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/Home/news/cubit/newsStates.dart';
import 'package:news/Home/news/cubit/newsWidgetCubitViewModel.dart';
import 'package:news/Home/news/newIteam.dart';
import 'package:news/appColors.dart';
import 'package:news/di/di.dart';
import 'package:news/model/source_response/source.dart';

class Newswidget extends StatefulWidget {
  final Source source;

  Newswidget({required this.source});

  @override
  State<Newswidget> createState() => _NewswidgetState();
}

class _NewswidgetState extends State<Newswidget> {
  late Newswidgetcubitviewmodel viewmodel;

  @override
  void initState() {
    super.initState();
    viewmodel = getIt<Newswidgetcubitviewmodel>();
    viewmodel.getNewsBySourceId(widget.source.id ?? '');
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<Newswidgetcubitviewmodel, Newsstates>(
      bloc: viewmodel,
      builder: (context, state) {
        if (state is newsLoadingState) {
          return Center(
            child: CircularProgressIndicator(
              color: Appcolors.primaryColor,
            ),
          );
        } else if (state is newsErrorState) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(state.errrorMessage),
              ElevatedButton(
                onPressed: () {
                  viewmodel.getNewsBySourceId(widget.source.id ?? '');
                },
                child: Text('Try Again'),
              ),
            ],
          );
        } else if (state is newsSucessState) {
          return ListView.builder(
            itemCount: state.newsList!.length,
            itemBuilder: (context, index) {
              var article = state.newsList!  [index];
              return Newiteam(news: article);
            },
          );
        }

        // Default state, return empty container
        return Container();
      },
    );
  }
}
