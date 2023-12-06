import 'package:attandace_teacher/controllers/loginController.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class start extends GetView<loginController> {
  const start({Key? key}) : super(key: key);

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
                                controller: controller.cCardId,
                                autofocus: true,
                                onEditingComplete: () => controller.login(),
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
