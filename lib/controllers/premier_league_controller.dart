import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:latihan1_11pplg2/config/api_config.dart';
import 'package:latihan1_11pplg2/models/premier_league_model.dart';

class PremierLeagueController extends GetxController {
  var isLoading = false.obs;
  var tableStandings = <Table>[].obs;
  
  @override
  void onInit() {
    super.onInit();
    fetchAPI();
  }
  
  void fetchAPI() async {
    final api = Uri.parse(ApiConfig.fetchPremierLeague);  
    try {
      isLoading.value = true;
      final res = await http.get(api);
      if (res.statusCode == 200) {
        final data = jsonDecode(res.body);
        final List standings = data['table'];
        tableStandings.assignAll(standings.map((e) => Table.fromJson(e),).toList());
      } else {
        Get.snackbar("Error", "Error Code : ${res.statusCode}", snackPosition: SnackPosition.BOTTOM);
      }
    } catch (e) {
      Get.snackbar("Error", "$e", snackPosition: SnackPosition.BOTTOM);
    }
    isLoading.value = false;
  }
}