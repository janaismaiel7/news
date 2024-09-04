
import 'package:news/model/source_response/source.dart';


abstract class Sourcestates {}//parent class

class sourceLoadingState extends Sourcestates{}

class sourceErrorState extends Sourcestates{
  String errorMessage;
  sourceErrorState({required this.errorMessage});
}
class sourceSuccessState extends Sourcestates{
  List<Source>? sourceList;
  sourceSuccessState({required this.sourceList});
}

