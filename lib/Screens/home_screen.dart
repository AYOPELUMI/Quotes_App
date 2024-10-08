// lib/screens/home_screen.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quote_app/Controllers/home_controller.dart';

import 'profile_screen.dart';
import 'quote_screen.dart';
import 'search_screen.dart';

class HomeScreen extends StatelessWidget {
  final List<Widget> _pages = [
    // Replace with your actual pages
    QuoteScreen(),
    SearchScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<HomeController>(
        init: HomeController(),
        builder: (controller) {
          return _pages[controller.selectedIndex.value];
        },
      ),
      bottomNavigationBar: GetBuilder<HomeController>(
        builder: (controller) {
          return BottomNavigationBar(
            currentIndex: controller.selectedIndex.value,
            onTap: (index) => controller.changeTab(index),
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.search),
                label: 'Search',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'Profile',
              ),
            ],
          );
        },
      ),
    );
  }
}
