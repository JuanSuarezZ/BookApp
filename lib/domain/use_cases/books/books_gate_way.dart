import 'package:bookapp/domain/models/book.dart';

abstract class BooksGateWay {
  Future<List<Book>> searchByTitle(String title, int page);
  Future<List<Book>> searchByAuthor(String author, int page);
}
