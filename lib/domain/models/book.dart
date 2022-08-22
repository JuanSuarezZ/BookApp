// To parse this JSON data, do
//
//     final book = bookFromMap(jsonString);

import 'dart:convert';

Book bookFromMap(String str) => Book.fromMap(json.decode(str));

String bookToMap(Book data) => json.encode(data.toMap());

class Book {
  Book({
    this.key,
    this.coverI,
    this.title,
    this.authorName,
    this.firstPublishYear,
    this.authorKey,
  });

  String? key;
  int? coverI;
  String? title;
  List<String>? authorName;
  int? firstPublishYear;
  List<String>? authorKey;

  factory Book.fromMap(Map<String, dynamic> json) => Book(
        key: json["key"],
        coverI: json["cover_i"],
        title: json["title"],
        authorName: List<String>.from(json["author_name"].map((x) => x)),
        firstPublishYear: json["first_publish_year"],
        authorKey: List<String>.from(json["author_key"].map((x) => x)),
      );

  Map<String, dynamic> toMap() => {
        "key": key,
        "cover_i": coverI,
        "title": title,
        "author_name": List<dynamic>.from(authorName!.map((x) => x)),
        "first_publish_year": firstPublishYear,
        "author_key": List<dynamic>.from(authorKey!.map((x) => x)),
      };
}
