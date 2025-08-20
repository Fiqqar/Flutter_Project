import 'package:get/get.dart';
import 'package:latihan1_11pplg2/routes/routes.dart';

class BottomNav extends GetxController {
  var currIndex = 0.obs;

  final List<String> pages = [
    AppRoutes.calculatorPage,
    AppRoutes.footballPage,
    AppRoutes.userProfile,
  ];

  void changePage(int index) {
    currIndex.value = index;
  }
}