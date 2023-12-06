import 'package:attandace_teacher/data/attendanceModel.dart';
import 'package:attandace_teacher/data/teacherModel.dart';
import 'package:attandace_teacher/modules/routes/app_pages.dart';
import 'package:attandace_teacher/services/attendance_services.dart';
import 'package:attandace_teacher/services/auth_api.dart';
import 'package:attandace_teacher/services/background_services.dart';
import 'package:android_alarm_manager_plus/android_alarm_manager_plus.dart';
import 'package:attandace_teacher/services/teacher_api.dart';
import 'package:attandace_teacher/services/teacher_services.dart';
import 'package:attandace_teacher/widgets/internet_messages.dart';
import 'package:attandace_teacher/widgets/loading.dart';
import 'package:attandace_teacher/widgets/success_messages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_network_connectivity/flutter_network_connectivity.dart';
import 'package:intl/intl.dart';
import 'package:get_storage/get_storage.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final FlutterNetworkConnectivity _flutterNetworkConnectivity =
      FlutterNetworkConnectivity(
    isContinousLookUp: true,
    lookUpDuration: const Duration(seconds: 5),
    lookUpUrl: 'google.com',
  );

  RxBool? isInternetAvailableStreamStatus = false.obs;
  RxList<Attendance> attendances = <Attendance>[].obs;
  TextEditingController cCardId = TextEditingController();
  final box = GetStorage();
  RxInt teacherTotal = 0.obs;
  RxString lastFetch = "".obs;

  Future<void> countTeachers() async {
    var results = await TeacherService().getTeachers();
    teacherTotal.value = results.length;
  }

  Future<void> getAttendancesToday() async {
    List<Attendance> results = await AttendanceService().getAttendancesToday();
    attendances.value = results;
  }

  Future<void> insertAttendance() async {
    try {
      if (cCardId.text == box.read("master_card")) {
        bool isSuccess = await AuthApi().logout();
        if (isSuccess) {
          await box.remove("master_card");
          await box.remove("token");
          await box.remove("name");
          await box.remove("email");

          Get.offAllNamed(Routes.START);
        }
      } else {
        Teacher teacher = await TeacherService().getTeacherById(cCardId.text);
        if (teacher.id != null) {
          String today =
              DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now());
          await AttendanceService().insertAttendance(
              Attendance(cardId: cCardId.text, createdAt: today));
          showSuccessMessage(teacher.name ?? '' + " berhasil absen !!");
          getAttendancesToday();
        }
        BackgroundServices.callback();
        cCardId.clear();
      }
    } catch (e) {
      showInternetMessage("Periksa Koneksi Internet Anda!");
    }
  }

  Future<void> getTeachers() async {
    try {
      showLoading();
      var results = await teacherApi().getTeachers();
      await TeacherService().deleteAllTeacher();

      if (results['status'] == 200) {
        ListTeacher teachers = results['teachers'] as ListTeacher;
        await TeacherService().deleteAllTeacher();
        teachers.teacher!.forEach((teacher) async {
          await TeacherService().insertTeacher(teacher);
        });

        showSuccessMessage("Berhasil fetch data siswa");
        countTeachers();
        await box.write(
            "fetchTeachers", DateFormat('dd-MM-yyyy').format(DateTime.now()));
        lastFetch.value = DateFormat('dd-MM-yyyy').format(DateTime.now());
      }
      stopLoading();
    } catch (e) {
      showInternetMessage("Periksa Koneksi Internet Anda!");
    }
  }

  Future<void> backgroundServices() async {
    await AndroidAlarmManager.periodic(
      const Duration(minutes: 1),
      1,
      () {
        BackgroundServices.callback();
        getAttendancesToday();
      },
      startAt: DateTime.now(),
      exact: true,
      wakeup: true,
    ).then((value) {
      getAttendancesToday();
    });
  }

  Future<void> getLastFetchTeachers() async {
    lastFetch.value = await box.read("fetchTeachers");
  }

  @override
  void onInit() {
    super.onInit();
    _flutterNetworkConnectivity.getInternetAvailabilityStream().listen((event) {
      isInternetAvailableStreamStatus?.value = event;
    });

    init();

    countTeachers();
    getAttendancesToday();
    getLastFetchTeachers();
    backgroundServices();
  }

  void init() async {
    await _flutterNetworkConnectivity.registerAvailabilityListener();
  }

  @override
  void onClose() {
    super.onClose();
    cCardId.dispose();
    _flutterNetworkConnectivity.unregisterAvailabilityListener();
  }
}
