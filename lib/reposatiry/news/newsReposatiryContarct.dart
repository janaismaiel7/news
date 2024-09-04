import 'package:news/model/news_response/news_response.dart';

abstract class Newsreposatirycontarct {
 Future<NewsResponse?> getNewsBySourceId(String sourceId);
}
