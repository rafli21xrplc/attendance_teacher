import 'dart:convert';

import 'package:attandace_teacher/data/userModel.dart';
import 'package:attandace_teacher/widgets/error_messages.dart';
import 'package:attandace_teacher/widgets/internet_messages.dart';
import 'package:attandace_teacher/widgets/loading.dart';
import 'package:http/http.dart' as http;
import 'package:attandace_teacher/services/api.dart';

class AuthApi extends SharedApi {
  Future<dynamic> loginApi(String cardId) async {
    try {
      var jsonData;
      showLoading();
      var data = await http.post(
        Uri.parse(baseUrl + 'login-by-card'),
        body: {'card_id': cardId},
      );
      stopLoading();
      jsonData = json.decode(data.body);
      print("data -> ${jsonData}");
      if (data.statusCode == 200) {
        var token = jsonData['data']['token'];
        jsonData['data'] = jsonData['data']['user'];
        jsonData['data']['status'] = 200;
        jsonData['data']['token'] = token;
        return UserModel.fromJson(jsonData['data']);
      } else {
        showErrorMessage(jsonData['meta']['message']);
        return UserModel.fromJson({"status": data.statusCode});
      }
    } on Exception catch (_) {
      stopLoading();
      // showInternetMessage("Periksa koneksi internet anda");
      return UserModel.fromJson({"status": 404});
    }
  }

  Future<dynamic> logout() async {
    try {
      var jsonData;
      showLoading();
      var headers = {
        ...getToken(),
        "Accept": "application/json",
      };
      var data = await http.post(
        Uri.parse(baseUrl + 'logout'),
        headers: headers,
      );
      stopLoading();
      jsonData = json.decode(data.body);
      if (data.statusCode == 200) {
        return true;
      } else {
        showErrorMessage(jsonData['meta']['message']);
        return false;
      }
    } on Exception catch (_) {
      stopLoading();
      showInternetMessage("Periksa koneksi internet anda");
      return false;
    }
  }
}
