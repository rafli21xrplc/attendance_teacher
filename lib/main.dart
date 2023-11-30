import 'package:attandace_teacher/modules/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:bot_toast/bot_toast.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        useMaterial3: true,
      ),
      builder: BotToastInit(),
      navigatorObservers: [BotToastNavigatorObserver()],
      initialRoute: AppPage.INITIAL,
      routes: AppPage.routes,
    );
  }
}
