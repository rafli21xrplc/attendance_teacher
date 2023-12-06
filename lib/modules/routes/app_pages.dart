// import 'package:attandace_teacher/modules/pages/home.dart';
// import 'package:attandace_teacher/modules/pages/start.dart';
// import 'package:flutter/material.dart';

// class AppPage {
//   static const INITIAL = Start.routeName;

//   static Map<String, WidgetBuilder> routes = {
//     Start.routeName: (context) => Start(),
//     Home.routeName: (context) => Home(),
//   };
// }

import 'package:attandace_teacher/modules/pages/binding/home_binding.dart';
import 'package:attandace_teacher/modules/pages/binding/start_binding.dart';
import 'package:attandace_teacher/modules/pages/home.dart';
import 'package:attandace_teacher/modules/pages/start.dart';
import 'package:get/get.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.START;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const Home(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.START,
      page: () => const start(),
      binding: StartBinding(),
    ),
  ];
}
