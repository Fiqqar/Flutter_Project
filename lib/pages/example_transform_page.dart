import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:latihan1_11pplg2/controllers/example_controller.dart';
import 'package:latihan1_11pplg2/pages/example_feature/example_mobile.dart';
import 'package:latihan1_11pplg2/pages/example_feature/example_tablet.dart';

class ExampleTransformPage extends StatelessWidget {
  ExampleTransformPage({super.key});

  final controller = Get.find<ExampleController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder:(context, constraints) {
          controller.updateLayout(constraints);
          return Obx(() => controller.isMobile.value ? ExampleMobile() : ExampleTablet());
        } ),
    );
  }
}