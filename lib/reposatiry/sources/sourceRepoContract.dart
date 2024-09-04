import 'package:news/model/source_response/source_response.dart';

abstract class Sourcerepocontract {
  Future<SourceResponse?> getSources(String categoryId);
}