import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:projectairquality/views/laporan/laporan_list.dart';
import 'package:projectairquality/views/loginsignup/login.dart';

class AuthPages extends StatelessWidget {
  const AuthPages({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return const LaporanList();
          } else {
            return const LoginPages();
          }
        },
      ),
    );
  }
}
