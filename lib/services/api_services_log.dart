import 'package:firebase_auth/firebase_auth.dart';

class ApiLog {
  Future loginUser(String email, password) async {
    await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);
  }
}
