import 'package:attandace_teacher/controllers/loginController.dart';
import 'package:get/get.dart';

class StartBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<loginController>(
      () => loginController(),
    );
  }
}
