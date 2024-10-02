import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/Home/news/cubit/newsStates.dart';
import 'package:news/Home/news/cubit/newsWidgetCubitViewModel.dart';
import 'package:news/Home/news/newIteam.dart';
import 'package:news/Home/news/newNavigator.dart';
import 'package:news/Home/news/newsWidgetViewModel.dart';
import 'package:news/appColors.dart';
import 'package:news/di/di.dart';
import 'package:provider/provider.dart';

import 'package:news/model/source_response/source.dart';

class Newswidget extends StatefulWidget {
  final Source source;

  Newswidget({required this.source});

  @override
  State<Newswidget> createState() => _NewswidgetState();
}

class _NewswidgetState extends State<Newswidget> implements Newnavigator {
 // late Newswidgetcubitviewmodel viewmodel;
 int currentPage = 1;
  int totalPages = 1;
  int itemsPerPage = 100;


  // @override
  // void initState() {
  //   super.initState();
  //   viewmodel = getIt<Newswidgetcubitviewmodel>();
  //   viewmodel.getNewsBySourceId(widget.source.id ?? '');
  // }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel.navigator=this;

  }
  Newswidgetviewmodel viewModel = Newswidgetviewmodel();
  @override
  Widget build(BuildContext context) {

  viewModel.getNewsBySourceId(widget.source.id??"");
    return ChangeNotifierProvider(
      create: (context)=> viewModel ,
      child: Consumer<Newswidgetviewmodel>(builder: (context , viewModel, child){
        if(viewModel.errorMessage!=null){
          return Column(
            children: [
              Text(viewModel.errorMessage!),
              ElevatedButton(onPressed: (){
                viewModel.getNewsBySourceId(widget.source.id??'');

              }, child: Text('Try agin'))
            ],
          );
        } else if(viewModel.newsList==null){
          return Center(
            child: CircularProgressIndicator(
              color: Appcolors.primaryColor,
            ),
          );
        } else  {
          return ListView.builder(itemBuilder: (context,index){
            if (index == viewModel.newsList!.length) {
              return Center(
                child: ElevatedButton(
                  onPressed: () {
                    viewModel.LoadingMoreData(widget.source.id ?? '');
                  },
                  child: viewModel.isLoadingMore
                      ? CircularProgressIndicator(color: Appcolors.primaryColor)
                      : Text('Load More'),
                ),
              );
            } else {
              return Newiteam(news: viewModel.newsList![index]);
            }


          },
              itemCount:viewModel.newsList!.length + 1);

        }
      }),
    );

  }

  @override
  void showMyMessage(String message) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0),
          ),
          backgroundColor: Colors.white, // Customize the background color
          content: Text(
            message,
            style: TextStyle(
              color: Colors.black54,
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text(
                'OK',
                style: TextStyle(
                  color: Colors.blue,
                ),
              ),
            ),
          ],
        );
      },
    );

  }

}

/*
    return FutureBuilder<NewsResponse?>(future: ApiManager.getNewsBySourceid(widget.source.id??''),
        builder: (context,snapshot){
          if(snapshot.connectionState==ConnectionState.waiting){
            return Center(
              child: CircularProgressIndicator(
                color: AppColors.primaryLight,
              ),

            );
          }else if(snapshot.hasError){
            return Column(
              children: [
                Text('Something went wrong'),
                ElevatedButton(onPressed: (){
                  ApiManager.getNewsBySourceid(widget.source.id??'');

                }, child: Text('Try agin'))
              ],

            );
          }
          if(snapshot.data!.status!='ok'){
            return Column(
              children: [
                Text(snapshot.data!.message!),
                ElevatedButton(onPressed: (){
                  ApiManager.getNewsBySourceid(widget.source.id??'');
                  setState(() {

                  });
                }, child: Text('Try again'))
              ],
            );

          }
          var newsList=snapshot.data!.articles!;
          return ListView.builder(itemBuilder: (context,index){
            return NewsItem(news: newsList[index]);
          },
          itemCount: newsList.length);



        });














//     return BlocBuilder<Newswidgetcubitviewmodel, Newsstates>(
//       bloc: viewmodel,
//       builder: (context, state) {
//         if (state is newsLoadingState) {
//           return Center(
//             child: CircularProgressIndicator(
//               color: Appcolors.primaryColor,
//             ),
//           );
//         } else if (state is newsErrorState) {
//           return Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               Text(state.errrorMessage),
//               ElevatedButton(
//                 onPressed: () {
//                   viewmodel.getNewsBySourceId(widget.source.id ?? '');
//                 },
//                 child: Text('Try Again'),
//               ),
//             ],
//           );
//         } else if (state is newsSucessState) {
//           return ListView.builder(
//             itemCount: state.newsList!.length,
//             itemBuilder: (context, index) {
//               var article = state.newsList!  [index];
//               return Newiteam(news: article);
//             },
//           );
//         }

//         // Default state, return empty container
//         return Container();
//       },
//     );
//   }
// }
*/
