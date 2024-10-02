// import 'package:injectable/injectable.dart';
// import 'package:news/api/apiManger.dart';
// import 'package:news/model/source_response/source_response.dart';
// import 'package:news/reposatiry/sources/sourceDataSource.dart';

// @Injectable(as:  sourceRemoteDataSource)
// class Sourceremotedatasourceimpi implements sourceRemoteDataSource{
//   Apimanger apimanger;
//   Sourceremotedatasourceimpi({required this.apimanger});
//   @override
//   Future<SourceResponse?> getSources(String categoryId) async {
//  var response =await apimanger.getSources(categoryId);
//  return response;
//   }

// }