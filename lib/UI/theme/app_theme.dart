import 'package:flutter/material.dart';

final darkTheme = ThemeData(
  // backgroundColor: const Color(0xff1F1F1F),
  backgroundColor: const Color(0xff212121),
  primaryColor: const Color(0xff4B4B4B),
  dividerColor: Colors.white,
  iconTheme: const IconThemeData(color: Colors.white),
  bottomAppBarTheme: const BottomAppBarTheme(color: Colors.black),
  errorColor: Colors.red,
  cardColor: Colors.grey[400],
  textSelectionTheme: const TextSelectionThemeData(
    cursorColor: Colors.white,
  ),
  textTheme: const TextTheme(
    //titulos
    headline1: TextStyle(
        color: Colors.white,
        fontSize: 26,
        fontFamily: "Roboto",
        fontWeight: FontWeight.w700),
    // subtitulos
    headline2: TextStyle(
        color: Colors.white,
        fontSize: 16,
        fontFamily: "Roboto",
        fontWeight: FontWeight.w700),
    //texto
    headline3: TextStyle(
        color: Colors.white,
        fontSize: 12,
        fontFamily: "Roboto",
        fontWeight: FontWeight.w400),
    //card text
    headline4: TextStyle(
        color: Colors.black,
        fontSize: 12,
        fontFamily: "Roboto",
        fontWeight: FontWeight.w300),
    // texto2
    bodyText1: TextStyle(
        color: Colors.white,
        fontSize: 14,
        fontFamily: "Roboto",
        fontWeight: FontWeight.w300),
  ),
  colorScheme: const ColorScheme.light(primary: Color(0xffB68D40)).copyWith(
    secondary: const Color(0xffB68D40),
  ),
);

final lightTheme = ThemeData(
  backgroundColor: const Color(0xffF5F5F5),
  primaryColor: Colors.grey[200],
  dividerColor: Colors.black,
  //

  cardColor: Colors.grey[400],
  iconTheme: const IconThemeData(color: Colors.black87),
  errorColor: Colors.red,
  bottomAppBarTheme: const BottomAppBarTheme(color: Colors.white54),

  textSelectionTheme: const TextSelectionThemeData(cursorColor: Colors.black26),
  textTheme: const TextTheme(
    //titulos
    headline1: TextStyle(
        color: Colors.black,
        fontSize: 26,
        fontFamily: "Roboto",
        fontWeight: FontWeight.w700),
    // subtitulos
    headline2: TextStyle(
        color: Colors.black,
        fontSize: 16,
        fontFamily: "Roboto",
        fontWeight: FontWeight.w400),
    //texto
    headline3: TextStyle(
        color: Colors.black,
        fontSize: 12,
        fontFamily: "Roboto",
        fontWeight: FontWeight.w400),
    //card text
    headline4: TextStyle(
        color: Colors.black,
        fontSize: 12,
        fontFamily: "Roboto",
        fontWeight: FontWeight.w300),
    // texto2
    bodyText1: TextStyle(
        color: Colors.black,
        fontSize: 14,
        fontFamily: "Roboto",
        fontWeight: FontWeight.w300),
  ),
  colorScheme: const ColorScheme.light(primary: Color(0xffB68D40))
      .copyWith(secondary: const Color(0xffB68D40)),
);
