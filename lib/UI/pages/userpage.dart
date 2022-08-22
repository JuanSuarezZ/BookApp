import 'package:bookapp/UI/pages/register.dart';
import 'package:bookapp/UI/pages/view_user.dart';
import 'package:bookapp/domain/use_cases/user/user_use_case.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserPage extends StatelessWidget {
  const UserPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<UserUseCase>(context);

    return provider.getUser() == null
        ? const RegisterPage()
        : const ViewUserPage();
  }
}
