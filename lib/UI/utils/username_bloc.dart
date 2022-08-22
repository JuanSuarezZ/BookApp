import 'dart:async';
import 'package:bookapp/core/helpers/validators.dart';
import 'package:bookapp/UI/utils/textfiel_bloc.dart';
import 'package:flutter/material.dart';

import 'package:rxdart/rxdart.dart';

class Usernamebloc extends PlantillaTextField with Validators {
  //controllers
  final _usernameTextController = TextEditingController();

  //streams
  final _usernameController = BehaviorSubject<String>();

  Stream<String> get usernameStream =>
      _usernameController.stream.transform(validarUserName);

  // Insertar valores al Stream
  Function(String) get changeUsername => _usernameController.sink.add;

  restartUsernameController() {
    _usernameController.sink.add("");
  }

  // Obtener el último valor ingresado a los streams
  String? get username => _usernameController.value;

  //geters
  getUsernameController() => _usernameTextController;

  dispose() {
    _usernameController.close();
  }

  //override the global funtions
  @override
  getstream() {
    return usernameStream;
  }

  @override
  getTextController() {
    return getUsernameController();
  }

  @override
  restartController() {
    return restartUsernameController();
  }

  @override
  changeStream() {
    return changeUsername;
  }

  @override
  valueofStream() {
    return username;
  }
}
