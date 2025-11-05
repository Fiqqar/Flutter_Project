import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:latihan1_11pplg2/routes/routes.dart';

class ProfileController extends GetxController {
  var name = "".obs;
  var email = "".obs;
  var photoUrl = "".obs;

  @override
  void onInit() {
    super.onInit();
    loadUserData();
  }

  Future<void> loadUserData() async {
    final prefs = await SharedPreferences.getInstance();
    name.value = prefs.getString('name') ?? "";
    email.value = prefs.getString('email') ?? "";
    photoUrl.value = prefs.getString('photoUrl') ?? "";
  }

  Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
    Get.snackbar('Logout', 'User data dihapus', snackPosition: SnackPosition.BOTTOM);
    Get.offAllNamed(AppRoutes.splashPage);
  }
}
