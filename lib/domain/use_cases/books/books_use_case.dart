import 'dart:developer';

import 'package:bookapp/domain/models/book.dart';
import 'package:bookapp/domain/use_cases/books/books_case_config.dart';
import 'package:bookapp/domain/use_cases/books/books_gate_way.dart';
import 'package:flutter/widgets.dart';

class BooksUseCase extends ChangeNotifier {
  //variables para la lista de libros

  final List<Book> _book = [];
  bool isLoading = false;
  bool isSearchBoxOpen = false;
  String currentTopic = '';
  String typeSearch = 'By Author';
  int page = 1;
  final TextEditingController _textcontroller = TextEditingController();

  late BooksGateWay _bookGateWay;

  BooksUseCase() {
    _bookGateWay = BooksUseCaseConfig().getway;
  }

  updatetypeSearch(String title) {
    typeSearch = title;
    notifyListeners();
  }

  getTextController() {
    return _textcontroller;
  }

  List<Book> getListBooks() {
    return _book;
  }

  setStateSearch() {
    isLoading = !isLoading;
  }

  setStateBoxSearch() {
    isSearchBoxOpen = !isSearchBoxOpen;
    notifyListeners();
  }

  Future<void> searchFromTextField() async {
    try {
      if (isLoading) {
        // print("no peticion, estoy cargando");
        return;
      }
      // print("estado controller: ${_textcontroller.text.isEmpty}");
      if (_textcontroller.text.isEmpty) {
        // print("busqueda nula");
        return;
      } else {
        isLoading = true;
        notifyListeners();

        currentTopic = _textcontroller.text;

        _book.clear();
        if (typeSearch == 'By Author') {
          await searchByAuthor(currentTopic);
        } else {
          await searchByTitle(currentTopic);
        }
        _textcontroller.clear();
        page = 1;

        isLoading = false;
        notifyListeners();
      }
    } catch (e) {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<void> searchByTitle(String name) async {
    currentTopic = name;
    isLoading = true;

    final newbooks = await _bookGateWay.searchByTitle(name, page);
    _book.addAll(newbooks);

    await Future.delayed(const Duration(seconds: 1), () {});
    //TODO:borrar
    log(_book.length.toString());
    isLoading = false;
    notifyListeners();
  }

  Future<void> searchByAuthor(String name) async {
    currentTopic = name;
    isLoading = true;

    final newbooks = await _bookGateWay.searchByAuthor(name, page);
    _book.addAll(newbooks);

    await Future.delayed(const Duration(seconds: 1), () {});
    //TODO:borrar
    log(_book.length.toString());
    isLoading = false;
    notifyListeners();
  }

  searchNextPage() async {
    try {
      if (isLoading) {
        return;
      }

      page++;

      isLoading = true;

      if (typeSearch == 'By Author') {
        await searchByAuthor(currentTopic);
      } else {
        await searchByTitle(currentTopic);
      }

      isLoading = false;
    } catch (e) {
      isLoading = false;
    }
  }

  // Future<bool> changePassword(String password) async {
  //   return await _userDataGateWay.changePassword(password);
  // }

  // Future<bool> editProfile(String username, String email2, String edad) async {
  //   return await _userDataGateWay.editProfile(username, email2, edad);
  // }

}
