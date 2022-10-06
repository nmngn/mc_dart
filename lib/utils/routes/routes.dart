
import 'package:mc_dart/ui/detail/detail.dart';
import 'package:mc_dart/ui/splash/splash.dart';
import 'package:flutter/material.dart';

class Routes {
  Routes._();

  //static variables
  static const String splash = '/splash';
  static const String home = '/home';
  static const String detail = '/detail.dart';

  static final routes = <String, WidgetBuilder>{
    splash: (BuildContext context) => SplashScreen(),
    detail: (BuildContext context) => DetailScreen(),
  };
}
