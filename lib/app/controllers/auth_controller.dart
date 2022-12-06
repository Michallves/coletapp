import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  User? user;
  @override
  void onInit() {
    super.onInit();
    authStateChanges();
  }

  showSnack(String title, String message) {
    Get.snackbar(title, message,
        backgroundColor: Colors.green,
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM);
  }

  authStateChanges() async {
    await _firebaseAuth.authStateChanges().listen((User? user) {
      if (user != null) {
        user = user;
      } else {
        signInAnonymously();
      }
    });
  }

  signInAnonymously() async {
    try {
      final userCredential = await _firebaseAuth.signInAnonymously();
    } on FirebaseAuthException catch (e) {
      showSnack("Erro", e.code);
    } finally {
      authStateChanges();
    }
  }
}
