import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Duration get loginTime => const Duration(milliseconds: 2250);

  Future<String?> authUser(LoginData data) async {
    debugPrint('Name: ${data.name}, Password: ${data.password}');
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: data.name,
        password: data.password,
      );
      return null;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        return 'User not exists';
      } else if (e.code == 'wrong-password') {
        return 'Password does not match';
      }
      return 'Error: $e';
    }
  }

  Future<String?> signupUser(SignupData data) async {
    debugPrint('Signup Name: ${data.name}, Password: ${data.password}');
    try {
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: data.name ?? "",
        password: data.password ?? "",
      );
      return null;
    } on FirebaseAuthException catch (e) {
      return 'Error: $e';
    }
  }

  Future<String> recoverPassword(String name) async {
    debugPrint('Name: $name');
    try {
      await _auth.sendPasswordResetEmail(email: name);
      return '';
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        return 'User not exists';
      }
      return 'Error: $e';
    }
  }
}
