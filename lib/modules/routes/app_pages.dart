import 'package:attandace_teacher/modules/pages/home.dart';
import 'package:attandace_teacher/modules/pages/start.dart';
import 'package:flutter/material.dart';

class AppPage {
  static const INITIAL = Start.routeName;

  static Map<String, WidgetBuilder> routes = {
    Start.routeName: (context) => Start(),
    Home.routeName: (context) => Home(),
  };
}
