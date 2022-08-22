import 'dart:async';

import 'package:bookapp/UI/utils/edad_bloc.dart';
import 'package:bookapp/UI/utils/email_bloc.dart';
import 'package:bookapp/UI/utils/gender_bloc.dart';
import 'package:bookapp/UI/utils/phone.dart';
import 'package:bookapp/UI/utils/username_bloc.dart';
import 'package:bookapp/core/helpers/validators.dart';
import 'package:rxdart/rxdart.dart';

class RegistroBloc with Validators {
  final Usernamebloc usernamebloc;
  final Usernamebloc usernamebloc2;
  final Emailbloc emailbloc;
  final AgeBloc ageBloc;
  final PhoneBloc phoneBloc;
  final GenderBloc genderBloc;

  RegistroBloc(this.usernamebloc, this.usernamebloc2, this.emailbloc,
      this.ageBloc, this.phoneBloc, this.genderBloc);

  Stream<bool> get formValidStream => Rx.combineLatest6(
      usernamebloc.getstream(),
      usernamebloc2.getstream(),
      emailbloc.getstream(),
      ageBloc.getstream(),
      phoneBloc.getstream(),
      genderBloc.getstream(),
      (a, b, c, d, e, f) => true);
}
