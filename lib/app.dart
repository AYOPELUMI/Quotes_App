import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'Bindings/bindings.dart';
import 'Screens/login_screen.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialBinding: MyBindings(),
      home: LoginScreen(),
      getPages: [
        GetPage(name: '/', page: () => LoginScreen()),
        // GetPage(name: '/home', page: () => HomeScreen()),
        // GetPage(name: '/profile', page: () => ProfileScreen()),
      ],
    );
  }
}
