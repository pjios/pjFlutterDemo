import 'package:pj_demoflutterapp/utils/routes/routes_name.dart';
import 'package:flutter/material.dart';
import 'package:pj_demoflutterapp/view/firstPage/first_screen.dart';
import 'package:pj_demoflutterapp/view/secondPage/second_screen.dart';


class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.firstPage:
        return MaterialPageRoute(
            builder: (BuildContext context) => const MyFirstPage());

      case RoutesName.secondPage:
        return MaterialPageRoute(
            builder: (BuildContext context) => const MySecondPage());

      default:
        return MaterialPageRoute(builder: (_) {
          return const Scaffold(
            body: Center(child: Text('No route defined')),
          );
        });
    }
  }
}
