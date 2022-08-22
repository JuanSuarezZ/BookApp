import 'dart:convert';
import 'dart:developer';
import 'package:bookapp/domain/models/book.dart';
import 'package:bookapp/domain/use_cases/books/books_gate_way.dart';
import 'package:http/http.dart' as http;

class BooksApi extends BooksGateWay {
  @override
  Future<List<Book>> searchByAuthor(String author, int page) async {
    log("author: $author");
    log("http://openlibrary.org/search.json?author=$author");
    try {
      List<Book> list = [];
      final respuesta = await http.get(
        Uri.parse("http://openlibrary.org/search.json?author=$author"),
      );

      final decoded = json.decode(respuesta.body);
      for (var i in decoded['docs']) {
        list.add(Book.fromMap(i));
      }

      return list;
    } catch (e) {
      return [];
    }
  }

  @override
  Future<List<Book>> searchByTitle(String title, int page) async {
    log("titulo: $title");
    log("http://openlibrary.org/search.json?title=$title&page=$page&limit=20");
    try {
      List<Book> list = [];
      final respuesta = await http.get(
        Uri.parse(
            "http://openlibrary.org/search.json?title=$title&page=$page&limit=20"),
      );

      final decoded = json.decode(respuesta.body);
      for (var i in decoded['docs']) {
        list.add(Book.fromMap(i));
      }

      return list;
    } catch (e) {
      return [];
    }
  }
}
