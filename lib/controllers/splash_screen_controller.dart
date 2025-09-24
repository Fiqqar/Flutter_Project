import 'package:get/get.dart';
import 'package:latihan1_11pplg2/routes/routes.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreenController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    checkLogin();
  }


  checkLogin() async{
    final pref = await SharedPreferences.getInstance();
    if(pref.getString('Username') != null)  {
      await Future.delayed(Duration(seconds: 3));
      Get.offAllNamed(AppRoutes.mainMenu);
    } else {
      await Future.delayed(Duration(seconds: 3));
      Get.offAllNamed(AppRoutes.loginPage);
    }
  }
}