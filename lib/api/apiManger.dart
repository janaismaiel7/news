import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';
import 'package:news/api/apiConstants.dart';
import 'package:news/model/news_response/article.dart';
import 'package:news/model/news_response/news_response.dart';
import 'package:news/model/source_response/source.dart';
import 'package:news/model/source_response/source_response.dart';



//@singleton
class Apimanger {
  // Apimanger._();//private Constructor
  // static Apimanger? _instance; //object

  // static Apimanger getInstance(){
  //   _instance?? Apimanger._();
  //   return _instance!;
  // }
static Future<SourceResponse?> getSources(String categoryId) async {
    try {
    
      Uri url = Uri.https(Apiconstants.baseUrl, Apiconstants.SourceApi, {
        'apiKey': '0fcf3512df954f2788c6953ef9b45e41',
        'category': categoryId
      });

     
      var response = await http.get(url);

      
      if (response.statusCode == 200) {
        // Parse the JSON response and return the SourceResponse object
        return SourceResponse.fromJson(jsonDecode(response.body));
      } else {
        // Handle other status codes (e.g., 400, 404, 500)
        print('Failed to load sources. Status code: ${response.statusCode}');
        return null;
      }
    } catch (e) {
      // Handle any errors that occur during the request
      print('Error occurred: $e');
      return null;
    }
  }

  //https://newsapi.org/v2/everything?q=bitcoin&apiKey=0fcf3512df954f2788c6953ef9b45e41
 static Future<NewsResponse?> getNewsBySourceId(String sourceId,{int page = 1, int pageSize = 10 }) async {
    try {
      Uri url = Uri.https(Apiconstants.baseUrl, Apiconstants.NewsApi,
          {'apiKey': '0fcf3512df954f2788c6953ef9b45e41', 
           'sources': sourceId,
           'page': page.toString(),
      'pageSize': pageSize.toString(),});
      var response = await http.get(url);
      if (response.statusCode == 200) {
        return NewsResponse.fromJson(jsonDecode(response.body));
      } else {
        print(
            'failed to load news response , status code :${response.statusCode}');
        return null;
      }
    } catch (e) {
      print('error :$e');
      return null;
    }
  }
   static Future<List<News>> searchList(String searchTerm) async {
    String encodedQuery = Uri.encodeComponent(searchTerm);

    Uri url = Uri.https(Apiconstants.baseUrl, Apiconstants.NewsApi, {
      'q': encodedQuery,
      'apiKey':  '0fcf3512df954f2788c6953ef9b45e41',
      'searchIn': 'title,description',
    });

    var response = await http.get(url);
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      List<News> searchResults = [];
      var articles = data['articles'] as List;
      for (var article in articles) {
        searchResults.add(News.fromJson(article));
      }
      return searchResults;
    } else {
      throw Exception('Failed to load search results');
    }
  }
}
