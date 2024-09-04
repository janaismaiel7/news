import 'package:news/api/apiManger.dart';
import 'package:news/model/news_response/news_response.dart';
import 'package:news/reposatiry/news/newsDataSource.dart';
import 'package:news/reposatiry/news/newsReposatiryContarct.dart';

class Newsreposatiryimpi implements Newsreposatirycontarct{
newsRemoteDataSource remoteDataSource;
Newsreposatiryimpi({required this.remoteDataSource});

  @override
  Future<NewsResponse?> getNewsBySourceId(String sourceId) {
   return remoteDataSource.getNewsSourceId(sourceId);
   
  }
}