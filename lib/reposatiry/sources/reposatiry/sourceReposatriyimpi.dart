import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:news/model/source_response/source_response.dart';
import 'package:news/reposatiry/sources/sourceDataSource.dart';
import 'package:news/reposatiry/sources/sourceRepoContract.dart';

class Sourcereposatriyimpi implements Sourcerepocontract{
sourceRemoteDataSource remoteDataSource;
sourceOfflineDataSource offlineDataSource;
Sourcereposatriyimpi({required this.remoteDataSource,required this.offlineDataSource});
  @override
  Future<SourceResponse?> getSources(String categoryId) async {
  //internet => remote
  var checkResult = Connectivity().checkConnectivity();
  if(checkResult ==ConnectivityResult.wifi || checkResult ==ConnectivityResult.mobile){
var SourceResponse =await remoteDataSource.getSources(categoryId);
offlineDataSource.saveSources(SourceResponse,categoryId);
return SourceResponse;
  }
  else{
  var SourceResponse = await offlineDataSource.getSources(categoryId);
  return SourceResponse;
  }

  }
}