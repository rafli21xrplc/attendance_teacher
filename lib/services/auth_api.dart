import 'dart:convert';

import 'package:attandace_teacher/data/userModel.dart';
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
      // log(data.body);
      if (data.statusCode == 200) {
        var token = jsonData['data']['token'];
        jsonData['data'] = jsonData['data']['user'];
        jsonData['data']['status'] = 200;
        jsonData['data']['token'] = token;
        return UserModel.fromJson(jsonData['data']);
      } else {
        // showErrorMessage(jsonData['meta']['message']);
        return UserModel.fromJson({"status": data.statusCode});
      }
    } on Exception catch (_) {
      stopLoading();
      // showInternetMessage("Periksa koneksi internet anda");
      return UserModel.fromJson({"status": 404});
    }
  }
}
