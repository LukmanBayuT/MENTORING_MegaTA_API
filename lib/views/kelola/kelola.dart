// ignore_for_file: unused_import

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:projectairquality/const/const.dart';
import 'package:projectairquality/views/authpages.dart/auth_pages.dart';

class KelolaPages extends StatefulWidget {
  const KelolaPages({Key? key}) : super(key: key);

  @override
  State<KelolaPages> createState() => _KelolaPagesState();
}

class _KelolaPagesState extends State<KelolaPages> {
  final user = FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Get.width,
      height: Get.height / 1.3,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
              width: Get.width,
              height: Get.height / 4,
              child: Lottie.asset('assets/animation/user_profile.json')),
          SizedBox(
              width: Get.width,
              height: Get.height / 4,
              child: Center(
                  child: Text(
                user!.email!,
                style: h1b,
              ))),
          SizedBox(
            width: Get.width,
            height: Get.height / 4,
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Card(
                child: SizedBox(
                  width: Get.width,
                  height: Get.height / 15,
                  child: ElevatedButton(
                    onPressed: () {
                      Get.to(() => const AuthPages());
                    },
                    child: Text(
                      'Menuju Laporan',
                      style: h1w,
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
