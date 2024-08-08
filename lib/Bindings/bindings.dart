import 'package:get/get.dart';

import '../Controllers/auth_controller.dart';
import '../Services/auth_services.dart';

class MyBindings implements Bindings {
  @override
  void dependencies(){
    Get.lazyPut(() => AuthService());
    Get.lazyPut(() => AuthController());
  // Get.lazyPutut(() => QuoteService());
  }
}