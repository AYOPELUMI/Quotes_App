import 'package:get/get.dart';

import '../Controllers/login_controller.dart';
import '../Controllers/signup_controller.dart';
import '../Services/auth_services.dart';

class MyBindings implements Bindings {
  @override
  void dependencies(){
    Get.lazyPut(() => AuthService());
    Get.lazyPut(() => LoginController());
    Get.lazyPut(() => SignupController());
  // Get.lazyPutut(() => QuoteService());
  }
}