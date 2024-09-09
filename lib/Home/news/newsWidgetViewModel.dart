// import 'package:flutter/material.dart';
// import 'package:news/api/apiManger.dart';
// import 'package:news/model/news_response/article.dart';
// import 'package:news/reposatiry/news/dataSource/newsRemoteDatSourceimpi.dart';
// import 'package:news/reposatiry/news/newsDataSource.dart';
// import 'package:news/reposatiry/news/newsReposatiryContarct.dart';
// import 'package:news/reposatiry/news/reposatiry/newsReposatiryimpi.dart';

// class Newswidgetviewmodel extends ChangeNotifier {
// // hold data + handle logic

// List<News>? newsList;
// String? errorMessage;
//  late Newsreposatirycontarct newsRepo;
//   late newsRemoteDataSource remoteDataSource;
//   late Apimanger apimanger;


// Newswidgetcubitviewmodel(){
// newsRepo =Newsreposatiryimpi(remoteDataSource: remoteDataSource);
// remoteDataSource =Newsremotedatsourceimpi(apimanger: apimanger);
// }

// void getNewsBySourceId(String sourceId) async{
//   newsList =null;
//   errorMessage =null;
//   notifyListeners();
//   var response = await newsRepo.getNewsBySourceId(sourceId);
//   try{
// if(response?.status!='ok'){
//   errorMessage=response!.message;
// }
// else{
//   newsList=response!.articles;
// }}
// catch(e){
//   errorMessage =e.toString();
// }
// notifyListeners();
// }
// }