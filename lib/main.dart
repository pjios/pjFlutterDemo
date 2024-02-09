import 'dart:ffi';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:pj_demoflutterapp/utils/routes/routes.dart';
import 'package:pj_demoflutterapp/utils/routes/routes_name.dart';
import 'package:pj_demoflutterapp/view/firstPage/first_screen.dart';
import 'package:pj_demoflutterapp/res/app_theme.dart';
import 'package:pj_demoflutterapp/res/color.dart';
import 'package:pj_demoflutterapp/res/style/text_style.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
  print("https://github.com/inamhusain/mvvm_with_provider?source=post_page-----a81164ef6da6--------------------------------");
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      scrollBehavior: CustomScrollBehavior(),
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.dark,
      theme: AppTheme().appTheme(),
      initialRoute: RoutesName.firstPage,
      onGenerateRoute: Routes.generateRoute,
    );
  }
}

class CustomScrollBehavior extends MaterialScrollBehavior {
  // Override behavior methods and getters like dragDevices
  @override
  Set<PointerDeviceKind> get dragDevices => {
    PointerDeviceKind.touch,
    PointerDeviceKind.mouse,
  };
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
