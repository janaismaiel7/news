import 'package:news/model/news_response/news_response.dart';

abstract class newsRemoteDataSource{
 Future<NewsResponse?> getNewsSourceId(String sourceId);
}
abstract class newsOfflineDataSource{}