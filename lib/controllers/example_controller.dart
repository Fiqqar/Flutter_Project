import 'package:get/get.dart';
import 'package:flutter/material.dart';

class ExampleController extends GetxController {
  var isMobile = true.obs;
  
  void updateLayout(BoxConstraints constraints) {
    isMobile.value = constraints.maxWidth < 600;
  }
}