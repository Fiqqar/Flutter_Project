import 'package:get/get.dart';
import 'package:latihan1_11pplg2/routes/routes.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreenController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    checkLogin();
  }

  checkLogin() async {
    final pref = await SharedPreferences.getInstance();
    final googleUid = pref.getString('google_uid');
    final token = pref.getString('token');
    await Future.delayed(Duration(seconds: 3));
    if (googleUid != null && googleUid.isNotEmpty || token != null && token.isNotEmpty) {
      Get.offAllNamed(AppRoutes.mainMenu);
    } else {
      Get.offAllNamed(AppRoutes.googleLoginPage);
    }
  }
}
