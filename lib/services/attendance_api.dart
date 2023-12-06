import 'dart:convert';

import 'package:attandace_teacher/widgets/error_messages.dart';
import 'package:attandace_teacher/widgets/success_messages.dart';
import 'package:http/http.dart' as http;
import 'package:attandace_teacher/services/api.dart';

class AttendanceApi extends SharedApi {
  Future<dynamic> postAttendance(Map<String, dynamic> attendanceData) async {
    try {
      var jsonData;

      var headers = getToken();
      var data = await http.post(
        Uri.parse(baseUrl + 'teacher-attendance'),
        headers: headers,
        body: attendanceData,
      );
      jsonData = json.decode(data.body);
      showErrorMessage(jsonData['meta']['message']);
      return true;
    } on Exception catch (e) {
      return false;
    }
  }
}
