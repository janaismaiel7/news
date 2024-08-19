import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:news/api/apiConstants.dart';
import 'package:news/model/news_response/news_response.dart';
import 'package:news/model/source_response/source.dart';
import 'package:news/model/source_response/source_response.dart';


class Apimanger {
  static Future<SourceResponse?> getSources() async {
    try {
      // Build the URL with the base URL and parameters
      Uri url = Uri.https(Apiconstants.baseUrl, Apiconstants.SourceApi,
          {'apiKey': '0fcf3512df954f2788c6953ef9b45e41'});

      // Send the HTTP GET request
      var response = await http.get(url);

      // Check if the response status code is 200 (OK)
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
static Future<NewsResponse?> getNewsBySourceId(String sourceId) async {
  try{
  Uri url =Uri.https(Apiconstants.baseUrl,Apiconstants.NewsApi,{
    'apiKey':'0fcf3512df954f2788c6953ef9b45e41',
    'sources': sourceId
  });
 var response=await http.get(url);
  if(response.statusCode==200){
return NewsResponse.fromJson(jsonDecode(response.body));
  }
  else{
    print('failed to load news response , status code :${response.statusCode}');
    return null;
  }
}

catch(e){
  print('error :$e');
  return null;
}}

}
