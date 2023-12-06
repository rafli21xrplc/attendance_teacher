import 'package:attandace_teacher/data/attendanceModel.dart';
import 'package:attandace_teacher/database/databaseHelper.dart';
import 'package:intl/intl.dart';

class AttendanceService {
  final _tbAttendances = 'teacher_attendances';
  final _tbTeacher = 'employees';

  Future<dynamic> getAttendancesToday() async {
    final db = await DatabaseHelper().database;

    String today = DateFormat('yyyy-MM-dd').format(DateTime.now());

    List<Map<String, dynamic>> results = await db!.rawQuery(
        "SELECT a.*, s.id as school_id, s.name, s.photo, s.employee_type FROM $_tbAttendances a JOIN $_tbTeacher s on a.card_id = s.card_id WHERE created_at like '%$today%' order by created_at desc limit 8");

    return results.map((res) => Attendance.fromJson(res)).toList();
  }

  Future<dynamic> getAllAttendancesToday() async {
    final db = await DatabaseHelper().database;

    String today = DateFormat('yyyy-MM-dd').format(DateTime.now());

    List<Map<String, dynamic>> results = await db!.rawQuery(
        "SELECT a.*, s.id as school_id, s.name, s.photo, s.employee_type FROM $_tbAttendances a JOIN $_tbTeacher s on a.card_id = s.card_id WHERE created_at like '%$today%' order by created_at asc");

    return results.map((res) => Attendance.fromJson(res)).toList();
  }

  Future<void> insertAttendance(Attendance attendance) async {
    final db = await DatabaseHelper().database;
    Map<String, dynamic> values = {
      "card_id": attendance.cardId,
      "created_at": attendance.createdAt,
    };
    await db!.insert(_tbAttendances, values);
  }

  Future<void> deleteAttendance(Attendance attendance) async {
    final db = await DatabaseHelper().database;
    await db!.delete(_tbAttendances, where: "id = '${attendance.id}'");
  }
}
