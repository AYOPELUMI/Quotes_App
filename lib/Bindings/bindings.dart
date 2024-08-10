import 'package:get/get.dart';

import '../Controllers/home_controller.dart';
import '../Controllers/login_controller.dart';
import '../Controllers/search_controller.dart';
import '../Controllers/signup_controller.dart';
import '../Services/auth_services.dart';
import '../Services/quote_service.dart';

class MyBindings implements Bindings {
  @override
  void dependencies(){
    Get.lazyPut(() => AuthService());
    Get.lazyPut(() => LoginController(), fenix:false);
    Get.lazyPut(() => SignupController());
    Get.lazyPut(() => QuoteService());
    Get.lazyPut(() => HomeController());
    Get.lazyPut(() => Searchcontroller(), fenix: true);

  }
}