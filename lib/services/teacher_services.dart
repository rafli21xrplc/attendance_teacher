import 'package:attandace_teacher/data/teacherModel.dart';
import 'package:attandace_teacher/database/databaseHelper.dart';

class TeacherService {
  final _tbStudents = 'employees';

  Future<List<Teacher>> getTeachers() async {
    final db = await DatabaseHelper().database;

    List<Map<String, dynamic>> results = await db!.query(_tbStudents);

    return results.map((res) => Teacher.fromJson(res)).toList();
  }

  Future<Teacher> getTeacherById(String id) async {
    final db = await DatabaseHelper().database;

    List<Map<String, dynamic>> results =
        await db!.rawQuery("SELECT * FROM $_tbStudents WHERE card_id = '$id'");

    return (results.isNotEmpty)
        ? Teacher.fromJson(results[0])
        : Teacher(
            card_id: null,
            id: null,
            name: null,
            photo: null,
            employee_type: null);
  }

  Future<void> insertTeacher(Teacher student) async {
    final db = await DatabaseHelper().database;
    await db!.insert(_tbStudents, student.toJson());
  }

  Future<void> deleteAllTeacher() async {
    final db = await DatabaseHelper().database;
    await db!.delete(_tbStudents);
  }
}
