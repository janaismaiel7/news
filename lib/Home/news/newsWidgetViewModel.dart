import 'package:flutter/material.dart';
import 'package:news/Home/news/newNavigator.dart';
import 'package:news/api/apiManger.dart';
import 'package:news/model/news_response/article.dart';
import 'package:news/model/search_response/source.dart';
import 'package:news/reposatiry/news/dataSource/newsRemoteDatSourceimpi.dart';
import 'package:news/reposatiry/news/newsDataSource.dart';
import 'package:news/reposatiry/news/newsReposatiryContarct.dart';
import 'package:news/reposatiry/news/reposatiry/newsReposatiryimpi.dart';

class Newswidgetviewmodel extends ChangeNotifier {
// hold data + handle logic

List<News>? newsList;
String? errorMessage;
bool isLoadingMore =false;
int currentPage =1;
 Newnavigator? navigator;
 int selectedIndex =0;
   List<Source> sources = [];
//  late Newsreposatirycontarct newsRepo;
//   late newsRemoteDataSource remoteDataSource;
 // late Apimanger apimanger;


// Newswidgetcubitviewmodel(){
// newsRepo =Newsreposatiryimpi(remoteDataSource: remoteDataSource);
// remoteDataSource =Newsremotedatsourceimpi(apimanger: apimanger);
// }

void getNewsBySourceId(String sourceId) async{
  newsList =null;
  errorMessage =null;
  notifyListeners();
  var response = await Apimanger.getNewsBySourceId(sourceId);
  try{
if(response?.status!='ok'){
  errorMessage=response!.message;
}
else{
  newsList=response!.articles;
}}
catch(e){
  errorMessage =e.toString();
}
notifyListeners();
}

void LoadingMoreData(String sourceId) async{
  if(isLoadingMore) return;
  isLoadingMore =true;
  notifyListeners();
  currentPage++;
  try{
    var newsResponse =await Apimanger.getNewsBySourceId(
      sourceId,page :currentPage
    );
    if(newsResponse!= null&& newsResponse.articles!=null ||
    newsResponse!.articles!.isNotEmpty){
      newsList!.addAll(newsResponse.articles!);
      isLoadingMore=false;
      notifyListeners();
    }
  }
  catch(e){
    errorMessage=e.toString();
  
  }
  finally{
    isLoadingMore=false;
    notifyListeners();
  }
}
void getNewsBySelectedTab(int index, String sourceId){

   selectedIndex =index;
   currentPage=1;
   getNewsBySourceId(sourceId);
   notifyListeners();
}
Future<void> searchNews (String sourceId,String searchTerm) async {
  try{
    var newsResponse =await Apimanger.getNewsBySourceId(sourceId);
    if(newsResponse!= null&& newsResponse.articles!=null ){
      newsList=newsResponse.articles!.where((news){
     final query =searchTerm.toLowerCase();
     return(news.title?.toLowerCase().contains(query)??false)||
      (news.author?.toLowerCase().contains(query)??false)|| 
      (news.publishedAt?.toLowerCase().contains(query)??false);
      }).toList();
      notifyListeners();
    }
  }
  catch(e){
errorMessage='Faild to Search News';
notifyListeners();
  }
}
}