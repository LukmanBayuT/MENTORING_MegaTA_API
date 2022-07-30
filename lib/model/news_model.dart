// To parse this JSON data, do
//
//     final newsModels = newsModelsFromJson(jsonString);

import 'dart:convert';

NewsModels newsModelsFromJson(String str) =>
    NewsModels.fromJson(json.decode(str));

String newsModelsToJson(NewsModels data) => json.encode(data.toJson());

class NewsModels {
  NewsModels({
    this.status,
    this.totalHits,
    this.page,
    this.totalPages,
    this.pageSize,
    this.articles,
    this.userInput,
  });

  final String? status;
  final int? totalHits;
  final int? page;
  final int? totalPages;
  final int? pageSize;
  final List<Article>? articles;
  final UserInput? userInput;

  factory NewsModels.fromJson(Map<String, dynamic> json) => NewsModels(
        status: json["status"],
        totalHits: json["total_hits"],
        page: json["page"],
        totalPages: json["total_pages"],
        pageSize: json["page_size"],
        articles: List<Article>.from(
            json["articles"].map((x) => Article.fromJson(x))),
        userInput: UserInput.fromJson(json["user_input"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "total_hits": totalHits,
        "page": page,
        "total_pages": totalPages,
        "page_size": pageSize,
        "articles": List<dynamic>.from(articles!.map((x) => x.toJson())),
        "user_input": userInput!.toJson(),
      };
}

class Article {
  Article({
    this.summary,
    this.country,
    this.author,
    this.link,
    this.language,
    this.media,
    this.title,
    this.mediaContent,
    this.cleanUrl,
    this.rights,
    this.rank,
    this.topic,
    this.publishedDate,
    this.id,
    this.score,
    this.originalSource,
  });

  final String? summary;
  final Country? country;
  final String? author;
  final String? link;
  final Lang? language;
  final String? media;
  final String? title;
  final List<String>? mediaContent;
  final String? cleanUrl;
  final String? rights;
  final int? rank;
  final Topic? topic;
  final DateTime? publishedDate;
  final String? id;
  final double? score;
  final String? originalSource;

  factory Article.fromJson(Map<String, dynamic> json) => Article(
        summary: json["summary"],
        country: countryValues.map![json["country"]],
        author: json["author"],
        link: json["link"],
        language: langValues.map![json["language"]],
        media: json["media"],
        title: json["title"],
        mediaContent: List<String>.from(json["media_content"].map((x) => x)),
        cleanUrl: json["clean_url"],
        rights: json["rights"],
        rank: json["rank"],
        topic: topicValues.map![json["topic"]],
        publishedDate: DateTime.parse(json["published_date"]),
        id: json["_id"],
        score: json["_score"].toDouble(),
        originalSource: json["original_source"],
      );

  Map<String, dynamic> toJson() => {
        "summary": summary,
        "country": countryValues.reverse![country],
        "author": author,
        "link": link,
        "language": langValues.reverse![language],
        "media": media,
        "title": title,
        "media_content": List<dynamic>.from(mediaContent!.map((x) => x)),
        "clean_url": cleanUrl,
        "rights": rights,
        "rank": rank,
        "topic": topicValues.reverse![topic],
        "published_date": publishedDate!.toIso8601String(),
        "_id": id,
        "_score": score,
        "original_source": originalSource,
      };
}

enum Country { IN, ID, CO, UNKNOWN }

final countryValues = EnumValues({
  "CO": Country.CO,
  "ID": Country.ID,
  "IN": Country.IN,
  "unknown": Country.UNKNOWN
});

enum Lang { ID }

final langValues = EnumValues({"id": Lang.ID});

enum Topic { NEWS, ECONOMICS, TRAVEL, TECH }

final topicValues = EnumValues({
  "economics": Topic.ECONOMICS,
  "news": Topic.NEWS,
  "tech": Topic.TECH,
  "travel": Topic.TRAVEL
});

class UserInput {
  UserInput({
    this.q,
    this.searchIn,
    this.linkBeginsWith,
    this.lang,
    this.country,
    this.from,
    this.to,
    this.rankedOnly,
    this.fromRank,
    this.toRank,
    this.sortBy,
    this.page,
    this.size,
    this.sources,
    this.notSources,
    this.topic,
    this.media,
  });

  final String? q;
  final String? searchIn;
  final dynamic linkBeginsWith;
  final Lang? lang;
  final dynamic country;
  final DateTime? from;
  final dynamic to;
  final String? rankedOnly;
  final dynamic fromRank;
  final dynamic toRank;
  final String? sortBy;
  final int? page;
  final int? size;
  final dynamic sources;
  final dynamic notSources;
  final dynamic topic;
  final String? media;

  factory UserInput.fromJson(Map<String, dynamic> json) => UserInput(
        q: json["q"],
        searchIn: json["search_in"],
        linkBeginsWith: json["link_begins_with"],
        lang: langValues.map![json["lang"]],
        country: json["country"],
        from: DateTime.parse(json["from"]),
        to: json["to"],
        rankedOnly: json["ranked_only"],
        fromRank: json["from_rank"],
        toRank: json["to_rank"],
        sortBy: json["sort_by"],
        page: json["page"],
        size: json["size"],
        sources: json["sources"],
        notSources: json["not_sources"],
        topic: json["topic"],
        media: json["media"],
      );

  Map<String, dynamic> toJson() => {
        "q": q,
        "search_in": searchIn,
        "link_begins_with": linkBeginsWith,
        "lang": langValues.reverse![lang],
        "country": country,
        "from": from!.toIso8601String(),
        "to": to,
        "ranked_only": rankedOnly,
        "from_rank": fromRank,
        "to_rank": toRank,
        "sort_by": sortBy,
        "page": page,
        "size": size,
        "sources": sources,
        "not_sources": notSources,
        "topic": topic,
        "media": media,
      };
}

class EnumValues<T> {
  Map<String, T>? map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String>? get reverse {
    reverseMap ??= map!.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
