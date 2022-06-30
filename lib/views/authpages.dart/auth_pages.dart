import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:projectairquality/views/loginsignup/login.dart';
import 'package:projectairquality/views/onboarding.dart';

class AuthPages extends StatelessWidget {
  const AuthPages({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return const Onboarding();
          } else {
            return const LoginPages();
          }
        },
      ),
    );
  }
}
