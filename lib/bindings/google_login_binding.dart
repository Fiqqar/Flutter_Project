import 'package:get/get.dart';
import 'package:latihan1_11pplg2/controllers/google_login_controller.dart';

class GoogleLoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GoogleLoginController>(() => GoogleLoginController());
  }

}