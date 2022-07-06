import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:projectairquality/views/laporan/laporan_list.dart';
import 'package:projectairquality/views/main_menu.dart';

class ApiLog {
  Future loginUser(String email, password) async {
    await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password)
        .then(
          (value) => Get.to(
            () => const LaporanList(),
          ),
        );
  }

  Future signUpUser(String email, password) async {
    await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password)
        .then(
          (value) => Get.to(
            () => const MainMenu(),
          ),
        );
  }
}
