import 'package:get/get.dart';
import 'package:latihan1_11pplg2/controllers/login_api_controller.dart';

class LoginApiBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginApiController>(() => LoginApiController());
  }
}