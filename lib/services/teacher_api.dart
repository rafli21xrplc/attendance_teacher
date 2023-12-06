import 'dart:convert';

import 'package:attandace_teacher/data/teacherModel.dart';
import 'package:http/http.dart' as http;
import 'package:attandace_teacher/services/api.dart';

class teacherApi extends SharedApi {
  Future<dynamic> getTeachers() async {
    var token = getToken();
    try {
      var data =
          await http.get(Uri.parse('${baseUrl}employees'), headers: token);
      var jsonData = json.decode(data.body);

      if (data.statusCode == 200) {
        return {"status": 200, "teachers": ListTeacher.fromJson(jsonData)};
      } else {
        return {"status": data.statusCode};
      }
    } catch (e) {
      throw ("Error");
    }
  }
}
