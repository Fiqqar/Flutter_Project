import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:latihan1_11pplg2/config/api_config.dart';
import 'package:latihan1_11pplg2/models/login_model.dart';
import 'package:latihan1_11pplg2/routes/routes.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginApiController extends GetxController {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  var isLoading = false.obs;
  var token = ''.obs;

  Future<void> login() async {
    if (usernameController.text.isEmpty || passwordController.text.isEmpty) {
      Get.snackbar(
        'Error',
        'Username dan Password wajib diisi',
        snackPosition: SnackPosition.BOTTOM,
      );
      return;
    }

    isLoading.value = true;

    try {
      final url = Uri.parse(ApiConfig.login);
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/x-www-form-urlencoded'},
        body: {
          'username': usernameController.text,
          'password': passwordController.text,
        },
      );

      if (response.statusCode == 200) {
        final data = loginModelFromJson(response.body);
        if (data.status) {
          token.value = data.token;
          final prefs = await SharedPreferences.getInstance();
          await prefs.setString('token', data.token);
          Get.snackbar('Sukses', data.message, snackPosition: SnackPosition.BOTTOM);
          Get.offAllNamed(AppRoutes.mainMenu);
        } else {
          Get.snackbar('Gagal', data.message, snackPosition: SnackPosition.BOTTOM);
        }
      } else {
        Get.snackbar(
          'Error',
          'Kode: ${response.statusCode}',
          snackPosition: SnackPosition.BOTTOM,
        );
      }
    } catch (e) {
      Get.snackbar('Error', e.toString(), snackPosition: SnackPosition.BOTTOM);
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> loadToken() async {
    final prefs = await SharedPreferences.getInstance();
    token.value = prefs.getString('token') ?? '';
  }
}
