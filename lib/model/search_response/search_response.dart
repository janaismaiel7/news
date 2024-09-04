import 'dart:convert';

import 'package:collection/collection.dart';

import 'article.dart';

class SearchResponse {
  String? status;
  int? totalResults;
  List<Article>? articles;
  String? code;
  String? message;

  SearchResponse({this.status, this.totalResults, this.articles, this.code,this.message});

  factory SearchResponse.fromMap(Map<String, dynamic> data) {
    return SearchResponse(
      status: data['status'] as String?,
      totalResults: data['totalResults'] as int?,
      articles: (data['articles'] as List<dynamic>?)
          ?.map((e) => Article.fromMap(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toMap() => {
        'status': status,
        'totalResults': totalResults,
        'articles': articles?.map((e) => e.toMap()).toList(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [SearchResponse].
  factory SearchResponse.fromJson(String data) {
    return SearchResponse.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [SearchResponse] to a JSON string.
  String toJson() => json.encode(toMap());

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! SearchResponse) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toMap(), toMap());
  }

  @override
  int get hashCode =>
      status.hashCode ^ totalResults.hashCode ^ articles.hashCode^ message.hashCode^ code.hashCode;
}
