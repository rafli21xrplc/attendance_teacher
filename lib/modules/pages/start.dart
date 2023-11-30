import 'dart:ffi';

import 'package:attandace_teacher/controllers/loginController.dart';
import 'package:attandace_teacher/data/userModel.dart';
import 'package:attandace_teacher/modules/pages/home.dart';
import 'package:attandace_teacher/services/auth_api.dart';
import 'package:attandace_teacher/widgets/loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';

class Start extends StatefulWidget {
  static const String routeName = '/';
  const Start({super.key});

  @override
  State<Start> createState() => _StartState();
}

class _StartState extends State<Start> {
  TextEditingController signInController = TextEditingController();

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
      Navigator.pushReplacementNamed(context, Home.routeName);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 24),
          child: ListView(
            children: [
              Row(
                children: [
                  Image.asset(
                    "assets/logo/logo.png",
                    width: 48,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 7,
                    child: SvgPicture.asset(
                      "assets/illustrations/illustration.svg",
                      width: 400,
                    ),
                  ),
                  Expanded(
                    flex: 5,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        RichText(
                          text: TextSpan(
                            style: GoogleFonts.poppins(
                              color: Colors.black,
                              fontSize: 32,
                            ),
                            children: const [
                              TextSpan(
                                text: "Ma",
                                style: TextStyle(
                                  color: Color(0xFF37B8F1),
                                ),
                              ),
                              TextSpan(text: "suk"),
                            ],
                          ),
                        ),
                        RichText(
                          text: TextSpan(
                            style: GoogleFonts.poppins(
                              color: Colors.black,
                              fontSize: 14,
                            ),
                            children: const [
                              TextSpan(text: "silakan tap "),
                              TextSpan(
                                text: "master card ",
                                style: TextStyle(
                                  color: Color(0xFF37B8F1),
                                ),
                              ),
                              TextSpan(
                                  text:
                                      "sekolah anda untuk memasuki halaman absensi"),
                            ],
                          ),
                        ),
                        Container(
                          child: Column(
                            children: [
                              SvgPicture.asset(
                                "assets/illustrations/scan.svg",
                                width: 300,
                              ),
                              TextFormField(
                                controller: signInController,
                                autofocus: true,
                                onEditingComplete: () =>
                                    login(signInController.text),
                                decoration: InputDecoration(
                                  fillColor: Colors.white,
                                  border: InputBorder.none,
                                ),
                                cursorColor: Colors.white,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
