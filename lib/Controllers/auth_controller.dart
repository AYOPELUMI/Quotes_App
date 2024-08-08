// lib/controllers/auth_controller.dart
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import '../Models/user_model.dart';
import '../Services/auth_services.dart';

class AuthController extends GetxController {
  final AuthService _authService = Get.find<AuthService>();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var user = Rx<UserModel?>(null);
  var errorMessage = ''.obs;

  Future<void> register() async {
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

      }
      catch (e) {
        errorMessage.value = e.toString();
      }
  }

  Future<void> login() async {
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
    }
    catch (e) {
      errorMessage.value = e.toString();
    }
  }

  Future<void> logout() async {
    await _authService.logout();
    user.value = null;
  }
}
