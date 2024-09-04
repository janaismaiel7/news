import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/Home/categories.dart/cubit/sourceStates.dart';
import 'package:news/api/apiManger.dart';
import 'package:news/reposatiry/sources/dataSource/sourceOfflineDataSourceimpl.dart';
import 'package:news/reposatiry/sources/dataSource/sourceRemoteDataSourceimpi.dart';
import 'package:news/reposatiry/sources/reposatiry/sourceReposatriyimpi.dart';
import 'package:news/reposatiry/sources/sourceDataSource.dart';
import 'package:news/reposatiry/sources/sourceRepoContract.dart';

class Categorydetailscubitviewmodel extends Cubit<Sourcestates> {
   late Sourcerepocontract sourcerepo;
   late sourceRemoteDataSource remoteDataSource;
   late sourceOfflineDataSource offlineDataSource;
   late Apimanger apimanger;
 

 Categorydetailscubitviewmodel():super(sourceLoadingState()){
  apimanger=Apimanger.getInstance();
  remoteDataSource=Sourceremotedatasourceimpi(apimanger: apimanger);
  offlineDataSource = Sourceofflinedatasourceimpl();
  sourcerepo =Sourcereposatriyimpi(remoteDataSource : remoteDataSource, offlineDataSource: offlineDataSource);
 }

  //hold data + handle logic
  
  void getSources(String categoryId) async {
    try {
      emit(sourceLoadingState());
      var response = await sourcerepo.getSources(categoryId);
      if(response?.status!='ok'){
        emit(sourceErrorState(errorMessage: response!.message!));
        return ;
      }
      if (response?.status == 'ok') {
        emit(sourceSuccessState(sourceList: response!.sources));
      }
    } catch (e) {
      emit(sourceErrorState(errorMessage: e.toString()));
    }
  }
}
