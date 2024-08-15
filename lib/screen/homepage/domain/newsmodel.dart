// // To parse this JSON data, do
// //
// //     final newsModel = newsModelFromJson(jsonString);

// import 'dart:convert';

// NewsModel newsModelFromJson(String str) => NewsModel.fromJson(json.decode(str));

// String newsModelToJson(NewsModel data) => json.encode(data.toJson());

// class NewsModel {
//   String? status;
//   int? totalResults;
//   List<Article>? articles;

//   NewsModel({
//     this.status,
//     this.totalResults,
//     this.articles,
//   });

//   factory NewsModel.fromJson(Map<String, dynamic> json) => NewsModel(
//         status: json["status"],
//         totalResults: json["totalResults"],
//         articles: json["articles"] == null
//             ? []
//             : List<Article>.from(
//                 json["articles"]!.map((x) => Article.fromJson(x))),
//       );

//   Map<String, dynamic> toJson() => {
//         "status": status,
//         "totalResults": totalResults,
//         "articles": articles == null
//             ? []
//             : List<dynamic>.from(articles!.map((x) => x.toJson())),
//       };
// }

// class Article {
//   Source? source;
//   String? author;
//   String? title;
//   String? description;
//   String? url;
//   String? urlToImage;
//   DateTime? publishedAt;
//   String? content;

//   Article({
//     this.source,
//     this.author,
//     this.title,
//     this.description,
//     this.url,
//     this.urlToImage,
//     this.publishedAt,
//     this.content,
//   });

//   factory Article.fromJson(Map<String, dynamic> json) => Article(
//         source: json["source"] == null ? null : Source.fromJson(json["source"]),
//         author: json["author"],
//         title: json["title"],
//         description: json["description"],
//         url: json["url"],
//         urlToImage: json["urlToImage"],
//         publishedAt: json["publishedAt"] == null
//             ? null
//             : DateTime.parse(json["publishedAt"]),
//         content: json["content"],
//       );

//   Map<String, dynamic> toJson() => {
//         "source": source?.toJson(),
//         "author": author,
//         "title": title,
//         "description": description,
//         "url": url,
//         "urlToImage": urlToImage,
//         "publishedAt": publishedAt?.toIso8601String(),
//         "content": content,
//       };
// }

// class Source {
//   Id? id;
//   Name? name;

//   Source({
//     this.id,
//     this.name,
//   });

//   factory Source.fromJson(Map<String, dynamic> json) => Source(
//         id: idValues.map[json["id"]]!,
//         name: nameValues.map[json["name"]]!,
//       );

//   Map<String, dynamic> toJson() => {
//         "id": idValues.reverse[id],
//         "name": nameValues.reverse[name],
//       };
// }

// enum Id { BBC_NEWS, USA_TODAY }

// final idValues =
//     EnumValues({"bbc-news": Id.BBC_NEWS, "usa-today": Id.USA_TODAY});

// enum Name { BBC_NEWS, USA_TODAY }

// final nameValues =
//     EnumValues({"BBC News": Name.BBC_NEWS, "USA Today": Name.USA_TODAY});

// class EnumValues<T> {
//   Map<String, T> map;
//   late Map<T, String> reverseMap;

//   EnumValues(this.map);

//   Map<T, String> get reverse {
//     reverseMap = map.map((k, v) => MapEntry(v, k));
//     return reverseMap;
//   }
// }

// To parse this JSON data, do
//
//     final newsModel = newsModelFromJson(jsonString);

import 'dart:convert';

NewsModel newsModelFromJson(String str) => NewsModel.fromJson(json.decode(str));

String newsModelToJson(NewsModel data) => json.encode(data.toJson());

class NewsModel {
  String status;
  int totalResults;
  List<Article> articles;

  NewsModel({
    required this.status,
    required this.totalResults,
    required this.articles,
  });

  factory NewsModel.fromJson(Map<String, dynamic> json) => NewsModel(
        status: json["status"],
        totalResults: json["totalResults"],
        articles: List<Article>.from(
            json["articles"].map((x) => Article.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "totalResults": totalResults,
        "articles": List<dynamic>.from(articles.map((x) => x.toJson())),
      };
}

class Article {
  Source source;
  String? author;
  String title;
  String? description;
  String url;
  String? urlToImage;
  DateTime publishedAt;
  String content;

  Article({
    required this.source,
    required this.author,
    required this.title,
    required this.description,
    required this.url,
    required this.urlToImage,
    required this.publishedAt,
    required this.content,
  });

  factory Article.fromJson(Map<String, dynamic> json) => Article(
        source: Source.fromJson(json["source"]),
        author: json["author"] ?? 'No Author',
        title: json["title"],
        description: json["description"],
        url: json["url"],
        urlToImage: json["urlToImage"],
        publishedAt: DateTime.parse(json["publishedAt"]),
        content: json["content"],
      );

  Map<String, dynamic> toJson() => {
        "source": source.toJson(),
        "author": author,
        "title": title,
        "description": description,
        "url": url,
        "urlToImage": urlToImage,
        "publishedAt": publishedAt.toIso8601String(),
        "content": content,
      };
}

class Source {
  Id? id;
  String name;

  Source({
    required this.id,
    required this.name,
  });

  factory Source.fromJson(Map<String, dynamic> json) => Source(
        id: idValues.map[json["id"]] ?? Id.BUSINESS_INSIDER,
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": idValues.reverse[id],
        "name": name,
      };
}

enum Id { BUSINESS_INSIDER, THE_VERGE, WIRED }

final idValues = EnumValues({
  "business-insider": Id.BUSINESS_INSIDER,
  "the-verge": Id.THE_VERGE,
  "wired": Id.WIRED
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
