import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:news/Home/news/cubit/newsStates.dart';
import 'package:news/api/apiManger.dart';
import 'package:news/reposatiry/news/dataSource/newsRemoteDatSourceimpi.dart';
import 'package:news/reposatiry/news/newsDataSource.dart';
import 'package:news/reposatiry/news/newsReposatiryContarct.dart';
import 'package:news/reposatiry/news/reposatiry/newsReposatiryimpi.dart';
@injectable
class Newswidgetcubitviewmodel extends Cubit<Newsstates>{
 Newsreposatirycontarct newsRepo;
 

Newswidgetcubitviewmodel({required this.newsRepo}):super(newsLoadingState());
//hold data + handle logic

void getNewsBySourceId (String sourceId)async{
  try{
   emit(newsLoadingState());
 var response= await newsRepo.getNewsBySourceId(sourceId);
 if(response?.status!='ok'){
     emit(newsErrorState(errrorMessage: response!.message!));
     return;
 }
 if(response?.status=='ok'){
  emit(newsSucessState(newsList: response!.articles));
 }
  }
  catch(e){
emit(newsErrorState(errrorMessage: e.toString()));
  }
}
}
