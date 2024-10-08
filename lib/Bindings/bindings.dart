import 'package:get/get.dart';

import '../Controllers/home_controller.dart';
import '../Controllers/login_controller.dart';
import '../Controllers/profile_controller.dart';
import '../Controllers/search_controller.dart';
import '../Controllers/signup_controller.dart';
import '../Controllers/splash_controller.dart';
import '../Services/auth_services.dart';
import '../Services/quote_service.dart';

class MyBindings implements Bindings {
  @override
  void dependencies(){
    Get.lazyPut(() => AuthService());
    Get.lazyPut(() => LoginController(), fenix:false);
    Get.lazyPut(() => SignupController());
    Get.lazyPut(() => SplashController());
    Get.lazyPut(() => QuoteService());
    Get.lazyPut(() => HomeController(), fenix: true);
    Get.lazyPut(() => Searchcontroller(), fenix: true);
    Get.lazyPut(() => ProfileController(), fenix: true);


  }
}