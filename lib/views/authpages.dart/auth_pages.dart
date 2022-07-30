import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:projectairquality/views/laporan/laporan_list.dart';
import 'package:projectairquality/views/loginsignup/login.dart';

class AuthPages extends StatelessWidget {
  const AuthPages({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //! kode 13 - 22, menunjukan penggunaan stream builder dengan firebase auth. gunanaya untuk mengecheck apakah user kita sudah login atau belum, dan disini terdapat 2 kondisi 1 kondisi login berarti akan langusng dilempar ke list laporan. 2 kondisi belum login akan dilempar ke registrasi screen
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
