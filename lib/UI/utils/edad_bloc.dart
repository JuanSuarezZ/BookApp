import 'dart:async';
import 'package:bookapp/core/helpers/validators.dart';
import 'package:bookapp/UI/utils/textfiel_bloc.dart';
import 'package:flutter/material.dart';

import 'package:rxdart/rxdart.dart';

class AgeBloc extends PlantillaTextField with Validators {
  //controllers
  final _edadTextController = TextEditingController();

  //streams
  final _edadController = BehaviorSubject<String>();

  // Recuperar los datos del Stream
  Stream<String> get edadStream =>
      _edadController.stream.transform(validarEdad);

  //add to Stream
  changeEdad(String age) {
    _edadController.sink.add(age);
  }

  //funtions of controller
  restartEdadController() {
    _edadController.sink.add("");
  }

  // get the last item added
  String? get edad => _edadController.value;

  //geters of textcontroller
  getEdadController() => _edadTextController;

  //dispose metod
  dispose() {
    _edadController.close();
  }

  //override the global funtions
  @override
  getstream() {
    return edadStream;
  }

  @override
  getTextController() {
    return getEdadController();
  }

  @override
  restartController() {
    restartEdadController();
  }

  @override
  changeStream() {
    return changeEdad;
  }

  @override
  valueofStream() {
    return edad;
  }
}
