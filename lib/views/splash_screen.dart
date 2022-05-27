import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projectairquality/views/onboarding.dart';

class SPlashScreen extends StatelessWidget {
  const SPlashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          Get.to(() => const Onboarding());
          // Navigator.push(
          //     context, MaterialPageRoute(builder: (context) => Onboarding()));
        },
        child: Container(
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
      ),
    );
  }
}
