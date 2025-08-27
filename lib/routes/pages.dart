import 'package:get/get.dart';
import 'package:latihan1_11pplg2/pages/calculator_page.dart';
import 'package:latihan1_11pplg2/pages/edit_football_player.dart';
import 'package:latihan1_11pplg2/pages/football_player.dart';
import 'package:latihan1_11pplg2/pages/main_menu_page.dart';
import 'package:latihan1_11pplg2/pages/user_profile.dart';
import 'package:latihan1_11pplg2/routes/routes.dart';

class AppPages {
  static final pages = [
    GetPage(name: AppRoutes.calculatorPage, page: () => CalculatorPage()),
    GetPage(name: AppRoutes.footballPage, page: () => FootballPlayer()),
    GetPage(name: AppRoutes.userProfile, page: () => UserProfile(),),
    GetPage(name: AppRoutes.editFootballPage, page: () => EditFootballPlayer()),
    GetPage(name: AppRoutes.mainMenu, page: () => MainMenuPage()),
  ];
}