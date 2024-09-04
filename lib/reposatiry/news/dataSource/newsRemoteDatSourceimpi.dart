import 'package:news/api/apiManger.dart';
import 'package:news/model/news_response/news_response.dart';
import 'package:news/reposatiry/news/newsDataSource.dart';

class Newsremotedatsourceimpi implements newsRemoteDataSource {
  Apimanger apimanger;
  Newsremotedatsourceimpi({required this.apimanger});
  @override
  Future<NewsResponse?> getNewsSourceId(String sourceId) async {
   var response= await apimanger.getNewsBySourceId(sourceId);
   return response; 
}
}