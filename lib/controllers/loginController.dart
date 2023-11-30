import 'package:attandace_teacher/data/userModel.dart';
import 'package:attandace_teacher/modules/pages/home.dart';
import 'package:attandace_teacher/services/auth_api.dart';
import 'package:attandace_teacher/widgets/loading.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class loginController {
  UserModel? usermodel;
  final box = GetStorage();
  TextEditingController cCardId = TextEditingController();

  Future<void> login(String card) async {
    usermodel = await AuthApi().loginApi(card);
    showLoading();
    print(usermodel?.status);
    if (usermodel?.status == 200) {
      await box.write("master_card", card);
      await box.write("token", usermodel!.token!);
      await box.write("name", usermodel!.name!);
      await box.write("email", usermodel!.email!);
      stopLoading();
      Navigator.pushReplacementNamed(Get.context!, Home.routeName);
    }
  }
}
