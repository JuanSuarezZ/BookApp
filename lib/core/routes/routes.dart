import 'package:bookapp/UI/pages/details.dart';
import 'package:bookapp/UI/pages/home.dart';
import 'package:bookapp/UI/pages/loading.dart';
import 'package:bookapp/UI/pages/userpage.dart';
import 'package:flutter/material.dart';

Map<String, Widget Function(BuildContext)> getAplicationRoutes = {
  'Home': (_) => const HomePage(),
  'LoadPreferences': (_) => const LoadPreferencesPage(),
  'Details': (_) => const DetailsPage(),
  'userpage': (_) => const UserPage(),
};
