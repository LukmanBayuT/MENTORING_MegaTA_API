import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projectairquality/views/onboarding.dart';

class SPlashScreen extends StatefulWidget {
  const SPlashScreen({Key? key}) : super(key: key);

  @override
  State<SPlashScreen> createState() => _SPlashScreenState();
}

class _SPlashScreenState extends State<SPlashScreen> {
  //! membuat fungsi untuk menuju screen onboarding
  void getToOnb() {
    Get.offAll(() => const Onboarding());
  }

  @override
  Widget build(BuildContext context) {
    //! menambah durasi agar terlihat lebih smooth
    Timer(const Duration(seconds: 3), getToOnb);

    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(color: Colors.amber),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/logo.png'),
            const SizedBox(
              height: 50,
            ),
            Image.asset('assets/tlogo.png'),
          ],
        ),
      ),
    );
  }
}
