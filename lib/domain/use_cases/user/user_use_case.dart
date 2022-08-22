import 'dart:convert';
import 'dart:developer';

import 'package:bookapp/UI/utils/edad_bloc.dart';
import 'package:bookapp/UI/utils/email_bloc.dart';
import 'package:bookapp/UI/utils/gender_bloc.dart';
import 'package:bookapp/UI/utils/phone.dart';
import 'package:bookapp/UI/utils/register_bloc.dart';
import 'package:bookapp/UI/utils/username_bloc.dart';
import 'package:bookapp/domain/models/user.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class UserUseCase extends ChangeNotifier {
  Usernamebloc? _usernamebloc;
  Usernamebloc? _lastnamebloc;
  Emailbloc? _emailbloc;
  AgeBloc? _ageBloc;
  PhoneBloc? _phoneBloc;
  GenderBloc? _genderBloc;
  late RegistroBloc? _registroBloc;
  final _storage = const FlutterSecureStorage();

  UserUseCase() {
    _usernamebloc = Usernamebloc();
    _lastnamebloc = Usernamebloc();
    _emailbloc = Emailbloc();
    _ageBloc = AgeBloc();
    _phoneBloc = PhoneBloc();
    _genderBloc = GenderBloc();
    _registroBloc = RegistroBloc(_usernamebloc!, _lastnamebloc!, _emailbloc!,
        _ageBloc!, _phoneBloc!, _genderBloc!);
  }

  String gender = '';
  String dateBirth = '';
  //
  User? user;

  deleteUser() {
    user = null;
    notifyListeners();
  }

  getRegistroBloc() {
    return _registroBloc;
  }

  getAge(DateTime birthDate) {
    var a = DateTime.now().toUtc();
    var b = birthDate.toUtc();
    dateBirth = "${birthDate.year}/${birthDate.month}/${birthDate.day}";
    var years = a.difference(b);
    log((years.inDays ~/ 365).toString());

    final Function(String) f = _ageBloc!.changeStream();
    f.call((years.inDays ~/ 365).toString());
  }

  saveProfile() async {
    try {
      final user = User(
        age: int.parse(_ageBloc!.edad!),
        dateofBirth: dateBirth,
        gender: gender,
        email: _emailbloc!.email!,
        lastname: _lastnamebloc!.username!,
        name: _usernamebloc!.username!,
        phone: int.parse(_phoneBloc!.edad!),
      );

      _ageBloc!.restartEdadController();
      _ageBloc!.getTextController().clear();

      _lastnamebloc!.restartUsernameController();
      _lastnamebloc!.getTextController().clear();

      _emailbloc!.restartEmailController();
      _emailbloc!.getTextController().clear();

      _usernamebloc!.restartUsernameController();
      _usernamebloc!.getTextController().clear();

      _phoneBloc!.restartEdadController();
      _phoneBloc!.getTextController().clear();

      gender = '';
      dateBirth = '';

      this.user = user;
      notifyListeners();
    } catch (e) {
      log(e.toString());
    }
  }

  setGender(gender) async {
    this.gender = gender;

    final Function(String) f = _genderBloc!.changeStream();
    f.call(gender);

    notifyListeners();
  }

  getPhoneBloc() {
    return _phoneBloc;
  }

  getUserNameBloc() {
    return _usernamebloc;
  }

  getLastnamebloc() {
    return _lastnamebloc;
  }

  getMailBloc() {
    return _emailbloc;
  }

  getAgeBloc() {
    return _ageBloc;
  }

  getUser() {
    return user;
  }

  setUser(User user) {
    this.user = user;
  }
}
