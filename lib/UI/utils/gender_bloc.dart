import 'dart:async';
import 'package:bookapp/core/helpers/validators.dart';
import 'package:bookapp/UI/utils/textfiel_bloc.dart';

import 'package:rxdart/rxdart.dart';

class GenderBloc extends PlantillaTextField with Validators {
  //streams
  final _ageController = BehaviorSubject<String>();

  // Recuperar los datos del Stream
  Stream<String> get ageStream => _ageController.stream;

  //add to Stream
  changeAge(String age) {
    _ageController.sink.add(age);
  }

  //funtions of controller
  restartAgeController() {
    _ageController.sink.add("");
  }

  // get the last item added
  String? get age => _ageController.value;

  //dispose metod
  dispose() {
    _ageController.close();
  }

  //override the global funtions
  @override
  getstream() {
    return ageStream;
  }

  @override
  getTextController() {}

  @override
  restartController() {
    restartAgeController();
  }

  @override
  changeStream() {
    return changeAge;
  }

  @override
  valueofStream() {
    return age;
  }
}
