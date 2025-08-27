import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:latihan1_11pplg2/pages/calculator_page.dart';
import 'package:latihan1_11pplg2/pages/football_player.dart';
import 'package:latihan1_11pplg2/pages/user_profile.dart';

class MainMenuController extends GetxController {
  var currIndex = 0.obs;

  final List<Widget> pages = [
    CalculatorPage(),
    FootballPlayer(),
    UserProfile(),
  ];

  final List<Map<String, dynamic>> menuItems = const [
    {"title": "Calculator", "icon": Icons.calculate},
    {"title": "Football", "icon": Icons.sports_soccer_rounded},
    {"title": "Profile", "icon": Icons.person},
  ];

  void changePage(int index) {
    currIndex.value = index;
  }
}
