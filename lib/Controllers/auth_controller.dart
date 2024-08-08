// lib/controllers/auth_controller.dart
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../Services/auth_services.dart';

class AuthController extends GetxController {
  final AuthService _authService = Get.find<AuthService>();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
   var user = Rx<User?>(null);

  Future<void> register() async {
    user.value = await _authService.registerWithEmailPassword(emailController.text, passwordController.text);
  }

  Future<void> login() async {
   user.value = await _authService.loginWithEmailPassword(emailController.text, passwordController.text);
  }

  Future<void> logout() async {
    await _authService.logout();
    user.value = null;
  }
}
