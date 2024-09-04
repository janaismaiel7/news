import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/Home/categories.dart/categoryDetailsViewModel.dart';
import 'package:news/Home/categories.dart/cubit/categoryDetailsCubitViewModel.dart';
import 'package:news/Home/categories.dart/cubit/sourceStates.dart';
import 'package:news/Home/tabs/tabsWidget.dart';
import 'package:news/api/apiManger.dart';
import 'package:news/appColors.dart';
import 'package:news/di/di_Impl.dart';
import 'package:news/model/category.dart';
import 'package:news/model/source_response/source_response.dart';
import 'package:provider/provider.dart';


class Categorydetails extends StatefulWidget {
  //msh shart a7tag statful widget m3a el bloc 3shan a7otha f heta wahda
  Categoryy categoryy;
  Categorydetails({required this.categoryy});

  @override
  State<Categorydetails> createState() => _CategorydetailsState();
}

class _CategorydetailsState extends State<Categorydetails> {
  //Categorydetailsviewmodel viewmodel = Categorydetailsviewmodel();
  Categorydetailscubitviewmodel viewmodel = Categorydetailscubitviewmodel(sourcerepo:injectSourceReposatiry() );

  @override
  void initState() {
    super.initState();
    viewmodel.getSources(widget.categoryy.id);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<Categorydetailscubitviewmodel, Sourcestates>(
        bloc: viewmodel,
        builder: (context, state) {
          if (state is sourceErrorState) {
            Column(
              children: [
                Text(
                  state.errorMessage,
                ),
                ElevatedButton(onPressed: () {
                  viewmodel.getSources(widget.categoryy.id);
                }, child: Text('try again'))
              ],
            );
          } else if (state is sourceSuccessState) {
            return Tabswidget(sourceList: state.sourceList!);
          }

          return Center(
              child: CircularProgressIndicator(
            color: Appcolors.primaryColor,
          ));
          // return Container();
        });

    //ChangeNotifierProvider(
    //   create: (context) => viewmodel,
    //   child: Consumer<Categorydetailsviewmodel>(
    //       builder: (context, viewmodel, child) {
    //     if (viewmodel.errorMessage != null) {
    //       return Column(
    //         children: [
    //           Text(viewmodel.errorMessage!),
    //           ElevatedButton(
    //               onPressed: () {
    //                 viewmodel.getSources(widget.categoryy.id);
    //               },
    //               child: Text('try again'))
    //         ],
    //       );
    //     }
    //     if (viewmodel.sourcesList == null) {
    //       return Center(
    //         child: CircularProgressIndicator(
    //           color: Appcolors.primaryColor,
    //         ),
    //       );
    //     } else {
    //       return Tabswidget(sourceList: viewmodel.sourcesList!);
    //     }
    //   }),
    // );
    // FutureBuilder<SourceResponse?>(
    //     future: Apimanger.getSources(widget.categoryy.id),
    //     builder: (context, snapshot) {
    //       if (snapshot.connectionState == ConnectionState.waiting) {
    //         return Center(
    //           child: CircularProgressIndicator(
    //             color: Appcolors.primaryColor,
    //           ),
    //         );
    //       } else if (snapshot.hasError) {
    //         return Column(
    //           children: [
    //             Text('Something went wrong'),
    //             ElevatedButton(
    //                 onPressed: () {
    //                   Apimanger.getSources(widget.categoryy.id);
    //                   setState(() {});
    //                 },
    //                 child: Text('try again'))
    //           ],
    //         );
    //       }
    //       if (snapshot.data!.status != 'ok') {
    //         return Center(
    //           child: Column(
    //             children: [
    //               Text(
    //                 'Something went wrong',
    //               ),
    //               ElevatedButton(
    //                   onPressed: () {
    //                     Apimanger.getSources(widget.categoryy.id);
    //                     setState(() {});
    //                   },
    //                   child: Text('try again'))
    //             ],
    //           ),
    //         );
    //       }
    //       var sourceList = snapshot.data!.sources;
    //       return Tabswidget(sourceList: sourceList!);
    //     });
  }
}
