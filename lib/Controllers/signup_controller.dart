// lib/controllers/auth_controller.dart
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import '../Models/user_model.dart';
import '../Services/auth_services.dart';

class SignupController extends GetxController {
  final AuthService _authService = Get.find<AuthService>();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var user = Rx<UserModel?>(null);
  var errorMessage = ''.obs;
  var isLoading = false.obs;

  Future<void> register() async {
    isLoading.value = true;
      try{
        user.value = await _authService.registerWithEmailPassword(emailController.text, passwordController.text);
        Fluttertoast.showToast(
        msg: 'register successfully',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 5,
        backgroundColor: Colors.green,
        textColor: Colors.white,
        fontSize: 16.0,);
        errorMessage.value="";
        isLoading.value = false;
        emailController.text="";
        passwordController.text="";
      }
      catch (e) {
        print("major error is  $e");
        errorMessage.value = e.toString();
        isLoading.value = false;
        Fluttertoast.showToast(
        msg: 'error signing up',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 5,
        backgroundColor: Colors.red.shade800,
        textColor: Colors.white,
        fontSize: 16.0,);
        isLoading.value = false;
      }
      update();
  }
}
