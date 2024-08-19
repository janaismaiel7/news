import 'package:collection/collection.dart';

import 'article.dart';

class NewsResponse {
  String? status;
  int? totalResults;
  List<News>? articles;
  String ?message;
  String? code;

  NewsResponse({this.status, this.totalResults, this.articles,this.code,this.message});

  factory NewsResponse.fromJson(Map<String, dynamic> json) => NewsResponse(
        status: json['status'] as String?,
        totalResults: json['totalResults'] as int?,
        articles: (json['articles'] as List<dynamic>?)
            ?.map((e) => News.fromJson(e as Map<String, dynamic>))
            .toList(),
            code: json['code'] as String?,
        message: json['message'] as String?

      );

  Map<String, dynamic> toJson() => {
        'status': status,
        'totalResults': totalResults,
        'articles': articles?.map((e) => e.toJson()).toList(),
         'message': message,
        'code': code,
      };

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! NewsResponse) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode =>
      status.hashCode ^ totalResults.hashCode ^ articles.hashCode ^  message.hashCode ^ code.hashCode;
}
