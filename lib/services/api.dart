import 'package:get_storage/get_storage.dart';

class SharedApi {
  String imageUrl = "https://posts.doyatama.com";
  String baseUrl = "https://core.mischool.online/api/";

  Map<String, String> getToken() {
    final box = GetStorage();
    String? token = box.read("token");
    if (token != null) {
      return {
        "Authorization": "Bearer " + token,
      };
    }

    return {
      "Authorization": "Bearer " + "Bad Token",
    };
  }
}
