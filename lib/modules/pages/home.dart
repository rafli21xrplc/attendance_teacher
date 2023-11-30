import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class Home extends StatefulWidget {
  static const String routeName = '/home-page';
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 24),
          child: ListView(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    "assets/logo/logo.png",
                    width: 48,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Row(
                        children: [
                          Row(
                            children: [
                              Text("Terhubung ke internet"),
                              const SizedBox(
                                width: 8,
                              ),
                              Container(
                                width: 12,
                                height: 12,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: Colors.red,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            width: 16,
                          ),
                          ElevatedButton(
                            onPressed: () {},
                            child: const Row(
                              children: [Icon(Icons.sync), Text("Sync Siswa")],
                            ),
                          ),
                        ],
                      ),
                      Text("Terakhir disinkronkan pada Hari Ini"),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 7,
                    child: Column(
                      children: [
                        Table(
                          children: [
                            TableRow(
                              decoration: const BoxDecoration(
                                color: Color(0xFF37B8F1),
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(8),
                                  topRight: Radius.circular(8),
                                ),
                              ),
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 24, vertical: 8),
                                  child: Text(
                                    "No",
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8),
                                  child: Text(
                                    "Nama",
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    "Kelas",
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    "Jam",
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            // Dummy Data
                            // for (int i = 0; i < 8; i++)
                            //   TableRow(
                            //     decoration: const BoxDecoration(
                            //       color: Color(0xFFFAFAFA),
                            //     ),
                            //     children: [
                            //       Padding(
                            //         padding: const EdgeInsets.symmetric(
                            //             horizontal: 24, vertical: 8),
                            //         child: Text(
                            //           "${i + 1}",
                            //           style: TextStyle(
                            //             fontSize: 16,
                            //           ),
                            //         ),
                            //       ),
                            //       Padding(
                            //         padding: const EdgeInsets.all(8.0),
                            //         child: Text(
                            //           "Dummy Name $i",
                            //           style: TextStyle(
                            //             fontSize: 16,
                            //           ),
                            //         ),
                            //       ),
                            //       Padding(
                            //         padding: const EdgeInsets.all(8.0),
                            //         child: Text(
                            //           "Dummy Class $i",
                            //           style: TextStyle(
                            //             fontSize: 16,
                            //           ),
                            //         ),
                            //       ),
                            //       Padding(
                            //         padding: const EdgeInsets.all(8.0),
                            //         child: Text(
                            //           "Dummy Time $i",
                            //           style: TextStyle(
                            //             fontSize: 16,
                            //           ),
                            //         ),
                            //       ),
                            //     ],
                            //   ),
                          ],
                        ),
                        RichText(
                          text: TextSpan(
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                            ),
                            children: const [
                              TextSpan(
                                text: "* ",
                                style: TextStyle(
                                  color: Color(0xFF37B8F1),
                                ),
                              ),
                              TextSpan(
                                text:
                                    "Hanya ditampilkan 8 (delapan) siswa yang terakhir absen.",
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Spacer(
                    flex: 1,
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
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 32,
                            ),
                            children: const [
                              TextSpan(
                                text: "Ab",
                                style: TextStyle(
                                  color: Color(0xFF37B8F1),
                                ),
                              ),
                              TextSpan(text: "sensi"),
                            ],
                          ),
                        ),
                        RichText(
                          text: TextSpan(
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                            ),
                            children: const [
                              TextSpan(text: "silakan tap "),
                              TextSpan(
                                text: "kartu pelajar ",
                                style: TextStyle(
                                  color: Color(0xFF37B8F1),
                                ),
                              ),
                              TextSpan(
                                text: "anda untuk melakukan absensi hari ini.",
                              ),
                            ],
                          ),
                        ),
                        Container(
                          child: Column(
                            children: [
                              SvgPicture.asset(
                                "assets/illustrations/scan.svg",
                                width: 250,
                              ),
                              // Container(
                              //   width: 250,
                              //   height: 250,
                              //   color: Colors.grey, // Placeholder color
                              // ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  RichText(
                                    text: TextSpan(
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 24,
                                      ),
                                      children: [
                                        TextSpan(
                                          text: "20",
                                          style: const TextStyle(
                                            color: Color(0xFF37B8F1),
                                          ),
                                        ),
                                        TextSpan(text: " Siswa"),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              TextFormField(
                                // controller: controller.cCardId,
                                autofocus: true,
                                onEditingComplete: () {},
                                // controller.insertAttendance(),
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
