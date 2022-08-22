import 'package:bookapp/UI/theme/theme_bloc.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

class LoadPreferencesPage extends StatefulWidget {
  const LoadPreferencesPage({Key? key}) : super(key: key);

  @override
  State<LoadPreferencesPage> createState() => _LoadPreferencesPageState();
}

class _LoadPreferencesPageState extends State<LoadPreferencesPage> {
  @override
  Widget build(BuildContext context) {
    final themeNotifier = Provider.of<BlocTheme>(context, listen: false);

    checkPreferences(themeNotifier);

    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }

  void checkPreferences(BlocTheme themeNotifier) async {
    await themeNotifier.getStorageTheme();
    await Future.delayed(const Duration(milliseconds: 500)).then((value) =>
        Navigator.pushNamedAndRemoveUntil(
            context, "Home", (Route<dynamic> route) => false));
  }
}
