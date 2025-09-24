import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:latihan1_11pplg2/controllers/splash_screen_controller.dart';
import 'package:latihan1_11pplg2/widget/txtv_cstm.dart';

class SplashScreenPage extends StatelessWidget {
  SplashScreenPage({super.key});

  final splashController = Get.find<SplashScreenController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CustomText(
          text: "Splash Screen",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}