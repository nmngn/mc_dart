
import 'package:flutter/material.dart';
import '../ui/detail.dart';
import '../ui/home.dart';

class Routes {
  Routes._();

  //static variables
  static const String splash = '/splash';
  static const String home = '/home';
  static const String detail = '/detail.dart';

  static final routes = <String, WidgetBuilder>{
    splash: (BuildContext context) => const HomeView(),
    detail: (BuildContext context) => const DetailView(),
  };
}