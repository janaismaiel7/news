

import 'package:flutter/material.dart';
import 'package:news/Home/categories.dart/cubit/sourceStates.dart';
import 'package:news/api/apiManger.dart';
import 'package:news/model/source_response/source.dart';
import 'package:news/reposatiry/news/newsDataSource.dart';
import 'package:news/reposatiry/sources/dataSource/sourceOfflineDataSourceimpl.dart';
import 'package:news/reposatiry/sources/dataSource/sourceRemoteDataSourceimpi.dart';
import 'package:news/reposatiry/sources/reposatiry/sourceReposatriyimpi.dart';
import 'package:news/reposatiry/sources/sourceDataSource.dart';
import 'package:news/reposatiry/sources/sourceRepoContract.dart';


class Categorydetailsviewmodel extends ChangeNotifier {
  late Sourcerepocontract sourcerepo;
  late sourceRemoteDataSource remoteDataSource;
  late Apimanger apimanger;
  late  sourceOfflineDataSource offlineDataSource;

 Categorydetailsviewmodel(){
  apimanger=Apimanger.getInstance();
  remoteDataSource=Sourceremotedatasourceimpi(apimanger: apimanger);
  offlineDataSource = Sourceofflinedatasourceimpl();
  sourcerepo =Sourcereposatriyimpi(remoteDataSource: remoteDataSource, offlineDataSource: offlineDataSource);
 }
  //hold data + handle logic
  List<Source>? sourcesList;
  String? errorMessage;
  void getSources(String categoryId) async{
    sourcesList=null;
    errorMessage=null;
    notifyListeners();
    try{
     var responses= await sourcerepo.getSources(categoryId);
     if(responses?.status=='error'){
      errorMessage=responses!.message;
     }
     else{
      sourcesList =responses!.sources;
     }
    
     }
     catch(e){
       errorMessage =e.toString();
     }
     notifyListeners();
  }
  
}
