import 'package:bookapp/UI/theme/theme_bloc.dart';
import 'package:bookapp/core/routes/routes.dart';
import 'package:bookapp/domain/use_cases/user/user_use_case.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:provider/provider.dart';

void main() async {
  //for shared preferens
  WidgetsFlutterBinding.ensureInitialized();
  //for nochbar color
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle.dark.copyWith(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ),
  );

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<BlocTheme>(create: (_) => BlocTheme()),
        ChangeNotifierProvider<UserUseCase>(
          create: (_) => UserUseCase(),
        ),
      ],
      child: const App(),
    ),
  );
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeNotifier = Provider.of<BlocTheme>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "LoadPreferences",
      routes: getAplicationRoutes,
      theme: themeNotifier.getTheme(),
    );
  }
}
