import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:latihan1_11pplg2/controllers/bottom_nav_controller.dart';
import 'package:latihan1_11pplg2/pages/calculator_page.dart';
import 'package:latihan1_11pplg2/pages/football_player.dart';
import 'package:latihan1_11pplg2/pages/user_profile.dart';

class BottomNavPage extends StatelessWidget {
  BottomNavPage({super.key});
  final BottomNav controller = Get.put(BottomNav());

  final List<Widget> pages = [
    CalculatorPage(),
    FootballPlayer(),
    UserProfile(),
  ];

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
          body: pages[controller.currIndex.value],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: controller.currIndex.value,
            onTap: controller.changePage,
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.calculate), label: "Calculator"),
              BottomNavigationBarItem(icon: Icon(Icons.sports_soccer), label: "Football"),
              BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
            ],
          ),
        ));
  }
}