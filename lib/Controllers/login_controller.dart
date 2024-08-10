// lib/controllers/auth_controller.dart
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import '../Models/user_model.dart';
import '../Services/auth_services.dart';

class LoginController extends GetxController {
  final AuthService _authService = Get.find<AuthService>();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var user = Rx<UserModel?>(null);
  var errorMessage = ''.obs;
  var isLoading = false.obs;

  Future<void> login() async {
    isLoading.value = true;
    try{       
      user.value = await _authService.loginWithEmailPassword(emailController.text, passwordController.text);
       Fluttertoast.showToast(
        msg: 'login successfully',
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
      errorMessage.value = e.toString();
              Fluttertoast.showToast(
        msg: 'error logging in',
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

  Future<void> logout() async {
    await _authService.logout();
    user.value = null;
  }
}
