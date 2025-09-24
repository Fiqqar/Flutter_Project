import 'package:get/get.dart';
import 'package:latihan1_11pplg2/controllers/calculator_controller.dart';
import 'package:latihan1_11pplg2/controllers/football_player_controller.dart';
import 'package:latihan1_11pplg2/controllers/profile_controller.dart';

class MainMenuBinding  extends Bindings{
  @override
  void dependencies() {
    // injecting controller (calculator, football, profile)
    Get.put(CalculatorController());
    Get.put(FootballPlayerController());
    Get.lazyPut<ProfileController>(() => ProfileController());
  }

}