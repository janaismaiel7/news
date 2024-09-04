//viewModel => object Reposatiry
//Repository => dataSource
//dataSource =>apiManger

import 'package:news/api/apiManger.dart';
import 'package:news/reposatiry/news/dataSource/newsRemoteDatSourceimpi.dart';
import 'package:news/reposatiry/news/newsDataSource.dart';
import 'package:news/reposatiry/news/newsReposatiryContarct.dart';
import 'package:news/reposatiry/news/reposatiry/newsReposatiryimpi.dart';
import 'package:news/reposatiry/sources/dataSource/sourceOfflineDataSourceimpl.dart';
import 'package:news/reposatiry/sources/dataSource/sourceRemoteDataSourceimpi.dart';
import 'package:news/reposatiry/sources/reposatiry/sourceReposatriyimpi.dart';
import 'package:news/reposatiry/sources/sourceDataSource.dart';
import 'package:news/reposatiry/sources/sourceRepoContract.dart';

Sourcerepocontract injectSourceReposatiry(){
  return Sourcereposatriyimpi
  (remoteDataSource: injectSourceRemoteDataSource(),
   offlineDataSource: injectSourceOfflineDataSource());
}
sourceRemoteDataSource injectSourceRemoteDataSource(){
  return Sourceremotedatasourceimpi(apimanger: Apimanger.getInstance());
}

sourceOfflineDataSource injectSourceOfflineDataSource(){
  return Sourceofflinedatasourceimpl();
}
Newsreposatirycontarct injectNewsReposatiry(){
  return Newsreposatiryimpi(remoteDataSource: injectNewsRemoteDataSource());
}
newsRemoteDataSource injectNewsRemoteDataSource(){
  return Newsremotedatsourceimpi(apimanger: Apimanger.getInstance());
}