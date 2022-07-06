import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projectairquality/services/api_services_log.dart';
import 'package:projectairquality/views/loginsignup/signup.dart';

class LoginPages extends StatefulWidget {
  const LoginPages({Key? key}) : super(key: key);

  @override
  State<LoginPages> createState() => _LoginPagesState();
}

class _LoginPagesState extends State<LoginPages> {
  final emailCont = TextEditingController();
  final passwordCont = TextEditingController();

  @override
  void dispose() {
    emailCont.text.trim();
    passwordCont.text.trim();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: Column(
            children: [
              Flexible(
                  flex: 5,
                  child: Center(child: Image.asset('assets/logo.png'))),
              const Flexible(
                  flex: 1,
                  child: Center(
                    child: Text(
                      'Air Quality',
                      style: TextStyle(
                          color: Colors.amber,
                          fontWeight: FontWeight.w800,
                          fontSize: 40),
                    ),
                  )),
              const Flexible(
                  flex: 1,
                  child: Center(
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'Aplikasi ini merupakan aplikasi untuk melihat Air Quality pada daerah daerah tertentu di Surabaya',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.w400,
                            fontSize: 14),
                      ),
                    ),
                  )),
              Flexible(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: emailCont,
                    decoration: InputDecoration(
                        labelText: 'Email',
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(width: 3, color: Colors.grey),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(width: 3, color: Colors.red),
                          borderRadius: BorderRadius.circular(15),
                        )),
                  ),
                ),
              ),
              Flexible(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: passwordCont,
                    decoration: InputDecoration(
                        labelText: 'Password',
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(width: 3, color: Colors.grey),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(width: 3, color: Colors.red),
                          borderRadius: BorderRadius.circular(15),
                        )),
                  ),
                ),
              ),
              Flexible(
                  flex: 1,
                  child: Center(
                      child: SizedBox(
                    width: Get.width / 1.1,
                    height: Get.height / 15,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10))),
                        onPressed: () {
                          ApiLog().loginUser(
                              emailCont.text.trim(), passwordCont.text.trim());
                        },
                        child: const Text(
                          'Masuk',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w800,
                              fontSize: 24),
                        )),
                  ))),
              Flexible(
                flex: 1,
                child: Center(
                  child: GestureDetector(
                    onTap: () {
                      Get.to(() => const SignUpScreen());
                    },
                    child: const Text(
                      'Daftar',
                      style: TextStyle(
                        color: Colors.amber,
                        fontWeight: FontWeight.w800,
                        fontSize: 24,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
