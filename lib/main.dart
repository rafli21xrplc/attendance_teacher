import 'dart:io';

import 'package:attandace_teacher/modules/routes/app_pages.dart';
// import 'package:attandace_teacher/services/background_services.dart';
import 'package:android_alarm_manager_plus/android_alarm_manager_plus.dart';
import 'package:attandace_teacher/services/background_services.dart';
import 'package:get_storage/get_storage.dart';
import 'package:flutter/material.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();

  final BackgroundServices _service = BackgroundServices();
  _service.initializeIsolate();

  if (Platform.isAndroid) await AndroidAlarmManager.initialize();

  runApp(GetMaterialApp(
    title: 'Flutter Demo',
    initialRoute: AppPages.INITIAL,
    onInit: () {
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.landscapeRight,
        DeviceOrientation.landscapeLeft,
      ]);
    },
    builder: BotToastInit(),
    getPages: AppPages.routes,
    navigatorObservers: [BotToastNavigatorObserver()],
  ));
}
