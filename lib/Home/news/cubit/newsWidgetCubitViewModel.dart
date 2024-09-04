import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/Home/news/cubit/newsStates.dart';
import 'package:news/api/apiManger.dart';
import 'package:news/reposatiry/news/dataSource/newsRemoteDatSourceimpi.dart';
import 'package:news/reposatiry/news/newsDataSource.dart';
import 'package:news/reposatiry/news/newsReposatiryContarct.dart';
import 'package:news/reposatiry/news/reposatiry/newsReposatiryimpi.dart';

class Newswidgetcubitviewmodel extends Cubit<Newsstates>{
 late Newsreposatirycontarct newsRepo;
  late newsRemoteDataSource remoteDataSource;
  late Apimanger apimanger;


Newswidgetcubitviewmodel():super(newsLoadingState()){
newsRepo =Newsreposatiryimpi(remoteDataSource: remoteDataSource);
remoteDataSource =Newsremotedatsourceimpi(apimanger: apimanger);
}
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
