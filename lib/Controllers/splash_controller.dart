
import 'dart:async';

import 'package:get/get.dart';

import '../Screens/login_screen.dart';
// Import the home screen

class SplashController extends GetxController {
  @override
  void onInit() {
        Future.delayed(Duration(seconds:4), (){
            Get.off(LoginScreen());
    },);
    super.onInit();
  }
}
