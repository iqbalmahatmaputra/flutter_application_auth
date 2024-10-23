import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_auth/app/routes/app_pages.dart';
import 'package:get/get.dart';

class ResetPasswordController extends GetxController {
  TextEditingController emailController = TextEditingController();
  FirebaseAuth auth = FirebaseAuth.instance;

  void resetPassword(String email) async {
    if (email != "" && GetUtils.isEmail(email)) {
      await auth.sendPasswordResetEmail(email: email);
      Get.snackbar('Success', 'Password reset link sent to your email');
      Get.offAllNamed(Routes.LOGIN);
    } else {
      Get.snackbar('Error', 'Please enter a valid email');
    }
  }
}
