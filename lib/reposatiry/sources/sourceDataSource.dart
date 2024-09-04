import 'package:news/model/source_response/source_response.dart';

abstract class sourceRemoteDataSource{
   Future<SourceResponse?> getSources(String categoryId);
}
abstract class sourceOfflineDataSource{
  Future <SourceResponse> getSources (String categoryId);
  void saveSources (SourceResponse? SourceResponse,String category);
}
abstract class sourceCachingDataSource{}