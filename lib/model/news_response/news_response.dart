import 'package:collection/collection.dart';

import 'article.dart';

class NewsResponse {
  String? status;
  int? totalResults;
  List<News>? articles;
  String? message;
  String? code;

  NewsResponse({
    this.status,
    this.totalResults,
    this.articles,
    this.code,
    this.message,
  });

  factory NewsResponse.fromJson(Map<String, dynamic>? json) {
    if (json == null) {
   
      return NewsResponse(
        status: null,
        totalResults: null,
        articles: null,
        code: null,
        message: null,
      );
    }

    return NewsResponse(
      status: json['status'] as String?,
      totalResults: json['totalResults'] as int?,
      articles: (json['articles'] as List<dynamic>?)
          ?.map((e) => News.fromJson(e as Map<String, dynamic>))
          .toList(),
      code: json['code'] as String?,
      message: json['message'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'status': status,
        'totalResults': totalResults,
        'articles': articles?.map((e) => e.toJson()).toList(),
        'message': message,
        'code': code,
      };
}