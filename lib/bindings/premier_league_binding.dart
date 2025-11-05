import 'package:get/get.dart';
import 'package:latihan1_11pplg2/controllers/premier_league_controller.dart';

class PremierLeagueBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PremierLeagueController>(() => PremierLeagueController());
  }

}