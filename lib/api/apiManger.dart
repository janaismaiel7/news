import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news/api/apiConstants.dart';
import 'package:news/model/source_response/source_response.dart';

//https://newsapi.org/v2/top-headlines/sources?apiKey=0fcf3512df954f2788c6953ef9b45e41
class Apimanger {
  static Future<SourceResponse?> getSources() async {
    Uri url = Uri.https(Apiconstants.baseUrl, Apiconstants.SourceApi,
        {'apiKey': '0fcf3512df954f2788c6953ef9b45e41'});
    var response = await http.get(url);
    try {
      SourceResponse.fromJson(jsonDecode(response.body));
    } catch (e) {
      throw e;
    }
  }
}
