import 'dart:isolate';
import 'dart:ui';

import 'package:attandace_teacher/data/attendanceModel.dart';
import 'package:attandace_teacher/services/attendance_api.dart';
import 'package:attandace_teacher/services/attendance_services.dart';

final ReceivePort port = ReceivePort();

class BackgroundServices {
  static BackgroundServices? _service;
  static String _isolateName = 'isolate';
  static SendPort? _uiSendPort;

  BackgroundServices._createObject();

  factory BackgroundServices() {
    return _service ??= BackgroundServices._createObject();
  }

  void initializeIsolate() {
    IsolateNameServer.registerPortWithName(port.sendPort, _isolateName);
  }

  static Future<void> callback() async {
    List<Attendance> attendancesToday =
        await AttendanceService().getAllAttendancesToday();

    attendancesToday.forEach((attendance) async {
      Map<String, dynamic> data = {
        "card_id": attendance.cardId,
        "created_at": attendance.createdAt
      };

      bool result = await AttendanceApi().postAttendance(data);
      if (result) {
        await AttendanceService().deleteAttendance(attendance);
      }
    });
  }
}
