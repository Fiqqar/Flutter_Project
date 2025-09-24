import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CalculatorController extends GetxController{
  final txtAngka1 = TextEditingController();
  final txtAngka2 = TextEditingController(); 
  var txtHasil = "".obs; 

  void add() {
    int angka1 = int.tryParse(txtAngka1.text) ?? 0;
    int angka2 = int.tryParse(txtAngka2.text) ?? 0;
    int hasil = angka1 + angka2;

    txtHasil.value = hasil.toString();

  }

  void subtract() {
    int angka1 = int.tryParse(txtAngka1.text) ?? 0;
    int angka2 = int.tryParse(txtAngka2.text) ?? 0;
    int hasil = angka1 - angka2;

    txtHasil.value = hasil.toString();
  }

  void multiply() {
    int angka1 = int.tryParse(txtAngka1.text) ?? 0;
    int angka2 = int.tryParse(txtAngka2.text) ?? 0;
    int hasil = angka1 * angka2;

    txtHasil.value = hasil.toString();
  }

  void divide() {
    int angka1 = int.tryParse(txtAngka1.text) ?? 0;
    int angka2 = int.tryParse(txtAngka2.text) ?? 0;
    if (angka2 == 0) {
      txtHasil.value = "Error: Division by zero";
      return;
    }
    double hasil = angka1 / angka2;

    txtHasil.value = hasil.toString();
  }

  void clear() {
    txtAngka1.clear();
    txtAngka2.clear();
    txtHasil.value = "";
  }
}