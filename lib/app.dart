import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quote_app/Routes/routes.dart';

import 'Bindings/bindings.dart';
import 'Screens/home_screen.dart';
import 'Screens/login_screen.dart';
import 'Screens/quote_screen.dart';
import 'Screens/signup_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialBinding: MyBindings(),
      home: const LoginScreen(),
      getPages: [
        GetPage(name: Routes.loginScreenRoute, page: () => const LoginScreen()),
        GetPage(name: Routes.homeScreenRoute, page: () => HomeScreen()),
        GetPage(name: Routes.signupScreenRoute, page: () => SignupScreen()),
        GetPage(name: Routes.quoteScreenRoute, page: () => QuoteScreen())
      ],
    );
  }
}
