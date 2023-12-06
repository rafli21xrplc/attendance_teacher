import 'package:attandace_teacher/data/userModel.dart';
import 'package:attandace_teacher/modules/routes/app_pages.dart';
import 'package:attandace_teacher/services/auth_api.dart';
import 'package:attandace_teacher/widgets/internet_messages.dart';
import 'package:attandace_teacher/widgets/loading.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class loginController extends GetxController {
  UserModel? usermodel;
  final box = GetStorage();
  TextEditingController cCardId = TextEditingController();

  final count = 0.obs;

  Future<void> login() async {
    try {
      showLoading();
      usermodel = await AuthApi().loginApi(cCardId.text);
      print(cCardId.text);
      print(usermodel?.status);
      if (usermodel?.status == 200) {
        await box.write("master_card", cCardId.text);
        await box.write("token", usermodel!.token!);
        await box.write("name", usermodel!.name!);
        await box.write("email", usermodel!.email!);
        update();
        stopLoading();
        Get.offAndToNamed(Routes.HOME);
      } else {
        cCardId.clear();
      }
      update();
      stopLoading();
    } catch (e) {
      showInternetMessage("Periksa Koneksi Internet Anda!");
    }
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
