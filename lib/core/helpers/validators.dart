import 'dart:async';
import 'dart:developer';

class Validators {
  final validarEmail =
      StreamTransformer<String, String>.fromHandlers(handleData: (email, sink) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = RegExp(pattern.toString());

    if (regExp.hasMatch(email)) {
      sink.add(email);
    } else {
      sink.addError('Invalid Email');
    }
  });

  final validarUserName =
      StreamTransformer<String, String>.fromHandlers(handleData: (name, sink) {
    Pattern pattern = r'^[a-zA-Z ]*$';

    RegExp regExp = RegExp(pattern.toString());

    if (regExp.hasMatch(name)) {
      sink.add(name);
      if (name.isEmpty) {
        sink.addError('Invalid Name');
      } else {
        sink.add(name);
      }
    } else {
      sink.addError('Invalid Name');
    }
  });

  final validarEdad =
      StreamTransformer<String, String>.fromHandlers(handleData: (edad, sink) {
    Pattern pattern = r'^[0-9]+$';
    RegExp regExp = RegExp(pattern.toString());

    if (regExp.hasMatch(edad)) {
      sink.add(edad);
    } else {
      sink.addError('Ingresa una edad valida');
    }
  });

  final validarPhone =
      StreamTransformer<String, String>.fromHandlers(handleData: (phone, sink) {
    Pattern pattern = r'^[0-9]+$';
    RegExp regExp = RegExp(pattern.toString());

    if (regExp.hasMatch(phone)) {
      if (phone.length == 10) {
        sink.add(phone);
      } else {
        sink.addError('Invalid Phone');
      }
    } else {
      sink.addError('Invalid Phone');
    }
  });

  final validarDescripcion = StreamTransformer<String, String>.fromHandlers(
      handleData: (descripcion, sink) {
    if (descripcion.length >= 40) {
      sink.add(descripcion);
    } else {
      sink.addError('Ingresa una descripcion mas larga');
    }
  });
}
