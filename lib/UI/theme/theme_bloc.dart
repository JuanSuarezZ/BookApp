import 'package:bookapp/UI/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class BlocTheme with ChangeNotifier {
  //
  final ThemeData _themeDataLight = lightTheme;
  final ThemeData _themeDataDark = darkTheme;
  late ThemeData _themaActual;
  final _storage = const FlutterSecureStorage();

  BlocTheme() {
    _themaActual = _themeDataLight;
  }

  getTheme() {
    return _themaActual;
  }

  setTheme() async {
    if (_themaActual == _themeDataDark) {
      saveTheme("light");
      _themaActual = _themeDataLight;
      SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark
          .copyWith(statusBarIconBrightness: Brightness.dark));
    } else {
      saveTheme("dark");
      _themaActual = _themeDataDark;
      SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light
          .copyWith(statusBarIconBrightness: Brightness.light));
    }
    notifyListeners();
  }

  getStorageTheme() async {
    final theme = await _storage.read(key: 'theme');
    if (theme == "light") {
      _themaActual = _themeDataLight;
    } else {
      _themaActual = _themeDataDark;
    }
    notifyListeners();
  }

  saveTheme(String string) {
    _storage.write(key: 'theme', value: string);
  }
}
