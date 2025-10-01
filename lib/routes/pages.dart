import 'package:get/get.dart';
import 'package:latihan1_11pplg2/bindings/contact_binding.dart';
import 'package:latihan1_11pplg2/bindings/login_binding.dart';
import 'package:latihan1_11pplg2/bindings/main_menu_binding.dart';
import 'package:latihan1_11pplg2/bindings/splash_binding.dart';
import 'package:latihan1_11pplg2/pages/calculator_page.dart';
import 'package:latihan1_11pplg2/pages/contact_page.dart';
import 'package:latihan1_11pplg2/pages/edit_football_player.dart';
import 'package:latihan1_11pplg2/pages/football_player.dart';
import 'package:latihan1_11pplg2/pages/login_page.dart';
import 'package:latihan1_11pplg2/pages/main_menu_page.dart';
import 'package:latihan1_11pplg2/pages/splash_screen_page.dart';
import 'package:latihan1_11pplg2/pages/user_profile.dart';
import 'package:latihan1_11pplg2/routes/routes.dart';

class AppPages {
  static final pages = [
    GetPage(name: AppRoutes.calculatorPage, page: () => CalculatorPage()),
    GetPage(name: AppRoutes.footballPage, page: () => FootballPlayer()),
    GetPage(name: AppRoutes.userProfile, page: () => UserProfile(),),
    GetPage(name: AppRoutes.editFootballPage, page: () => EditFootballPlayer()),
    GetPage(name: AppRoutes.mainMenu, page: () => MainMenuPage(), binding: MainMenuBinding()),
    // sharedpreferences
    GetPage(name: AppRoutes.loginPage, page: () => LoginPage(), binding: LoginBinding()),
    GetPage(name: AppRoutes.splashPage, page: () => SplashScreenPage(), binding: SplashBinding()),
    GetPage(name: AppRoutes.contactPage, page: () => ContactPage(), binding: ContactBinding()),
  ];
}