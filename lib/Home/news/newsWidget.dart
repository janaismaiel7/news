import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/Home/categories.dart/cubit/sourceStates.dart';
import 'package:news/Home/news/cubit/newsStates.dart';
import 'package:news/Home/news/cubit/newsWidgetCubitViewModel.dart';
import 'package:news/Home/news/newIteam.dart';
import 'package:news/Home/news/newsWidgetViewModel.dart';
import 'package:news/api/apiManger.dart';
import 'package:news/appColors.dart';
import 'package:news/di/di.dart';
import 'package:news/di/di_Impl.dart';
import 'package:news/model/news_response/article.dart';
import 'package:news/model/news_response/news_response.dart';
import 'package:news/model/source_response/source.dart';
import 'package:provider/provider.dart';

class Newswidget extends StatefulWidget {
  final Source source;

  Newswidget({required this.source});

  @override
  State<Newswidget> createState() => _NewswidgetState();
}

class _NewswidgetState extends State<Newswidget> {
  // Newswidgetviewmodel viewmodel =Newswidgetviewmodel();
  Newswidgetcubitviewmodel viewmodel =
  getIt<Newswidgetcubitviewmodel>();

  @override
  initState() {
    super.initState();
    viewmodel.getNewsBySourceId(widget.source.id ?? '');
  }
  //mmkn mn3mlsh init state w nkhleh statless widget w nandy satr t3ref el view model fl build

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
      }  if (state is newsErrorState) {
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
      }  if (state is newsSucessState) {
        return ListView.builder(
          itemCount: state.newsList!.length ?? 0,
          itemBuilder: (context, index) {
            var article = state.newsList![index];
            return Newiteam(news: state.newsList![index]);
          },
        );
      }

      return Container();
    });
    // ChangeNotifierProvider( create: (context)=> viewmodel,
//     child: Consumer<Newswidgetviewmodel>(
//       builder: (context,viewmodel,child){
// if(viewmodel.errorMessage!= null){
//   return Column(
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   Text(viewmodel.errorMessage!),
//                   ElevatedButton(
//                     onPressed: () {
//                     viewmodel.getNewsBySourceId(widget.source.id??'');
//                     },
//                     child: Text('Try Again'),
//                   ),
//                 ],
//               );
// }
// else if(viewmodel.newsList==null){
//      return Center(
//               child: CircularProgressIndicator(
//                 color: Appcolors.primaryColor,
//               ),
//             );
// }
// else{
//   return ListView.builder(
//               itemCount: viewmodel.newsList!.length ?? 0,
//               itemBuilder: (context, index) {
//                 var article = viewmodel.newsList![index];
//                 return Newiteam(news: viewmodel.newsList![index]);
//               },
//             );
// }

//       }),

    // child: FutureBuilder<NewsResponse?>(
    //   future: Apimanger.getNewsBySourceId(widget.source.id ?? ''),
    //   builder: (context, snapshot) {
    //     if (snapshot.connectionState == ConnectionState.waiting) {
    //       return Center(
    //         child: CircularProgressIndicator(
    //           color: Appcolors.primaryColor,
    //         ),
    //       );
    //     } else if (snapshot.hasError) {
    //       return Center(
    //         child: Column(
    //           mainAxisSize: MainAxisSize.min,
    //           children: [
    //             Text('Something went wrong'),
    //             ElevatedButton(
    //               onPressed: () {
    //                 setState(() {});
    //               },
    //               child: Text('Try Again'),
    //             ),
    //           ],
    //         ),
    //       );
    //     } else if (snapshot.hasData && snapshot.data!.status == 'ok') {
    //       var newsList = snapshot.data!.articles;
    //       return ListView.builder(
    //         itemCount: newsList?.length ?? 0,
    //         itemBuilder: (context, index) {
    //           var article = newsList?[index];
    //           return Newiteam(news: newsList![index]);
    //         },
    //       );
    //     } else {
    //       return Center(
    //         child: Column(
    //           mainAxisSize: MainAxisSize.min,
    //           children: [
    //             Text('Something went wrong'),
    //             ElevatedButton(
    //               onPressed: () {
    //                 setState(() {});
    //               },
    //               child: Text('Try Again'),
    //             ),
    //           ],
    //         ),
    //       );
    //     }
    //   },
    // ),
  }
}
