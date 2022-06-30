// ignore_for_file: unused_import

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class KelolaPages extends StatefulWidget {
  const KelolaPages({Key? key}) : super(key: key);

  @override
  State<KelolaPages> createState() => _KelolaPagesState();
}

class _KelolaPagesState extends State<KelolaPages> {
  final user = FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      height: Get.height / 1.3,
      child: Column(
        children: [
          SizedBox(
              width: Get.width,
              height: Get.height / 4,
              child: Lottie.asset('assets/animation/user_profile.json')),
          SizedBox(
            width: Get.width,
            height: Get.height / 4,
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Card(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      user!.email!,
                      style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
