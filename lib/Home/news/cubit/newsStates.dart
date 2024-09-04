

import '../../../model/news_response/article.dart';

abstract class Newsstates {}
 //parent class
class newsLoadingState extends Newsstates{}
class newsErrorState extends Newsstates{
  String errrorMessage;
  newsErrorState({required this.errrorMessage});
}
class newsSucessState extends Newsstates{
  List<News>? newsList;
  newsSucessState({required this.newsList});
}