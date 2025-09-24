import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:latihan1_11pplg2/routes/routes.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends GetxController {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  login() async {
    if (usernameController.text.toString() == 'admin' &&
        passwordController.text.toString() == 'admin') {
      final pref = await SharedPreferences.getInstance();
      pref.setString("Username", usernameController.text.toString());
      Get.offAllNamed(AppRoutes.mainMenu);
    } else {
      Get.snackbar("Error", "Invalid username or password");
      passwordController.clear();
    }
  }
}