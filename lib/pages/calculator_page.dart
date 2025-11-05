import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:latihan1_11pplg2/controllers/calculator_controller.dart';
import 'package:latihan1_11pplg2/widget/btn_submit.dart';
import 'package:latihan1_11pplg2/widget/txt_user.dart';

class CalculatorPage extends StatelessWidget {
  CalculatorPage({super.key});

  // final CalculatorController calculatorController = Get.put(
  //   CalculatorController(),
  // );

  final calculatorController = Get.find<CalculatorController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Calculator Page',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.blueAccent,
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.all(24),
        color: Colors.grey[100],
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TxtUser(
              isNumber: true,
              controller: calculatorController.txtAngka1,
              labelText: "Angka 1",
              hintText: "Input angka 1",
            ),
            const Padding(padding: EdgeInsets.only(top: 16)),
            TxtUser(
              isNumber: true,
              controller: calculatorController.txtAngka2,
              labelText: "Angka 2",
              hintText: "Input angka 2",
            ),
            const Padding(padding: EdgeInsets.only(top: 24)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SubmitButton(
                  label: "+",
                  labelColor: Colors.black,
                  onPressed: () {
                    calculatorController.add();
                  },
                ),
                SubmitButton(
                  label: "-",
                  labelColor: Colors.black,
                  onPressed: () {
                    calculatorController.subtract();
                  },
                ),
              ],
            ),
            const Padding(padding: EdgeInsets.only(top: 12)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SubmitButton(
                  label: "X",
                  labelColor: Colors.black,
                  onPressed: () {
                    calculatorController.multiply();
                  },
                ),
                SubmitButton(
                  label: "/",
                  labelColor: Colors.black,
                  onPressed: () {
                    calculatorController.divide();
                  },
                ),
              ],
            ),
            const Padding(padding: EdgeInsets.only(top: 24)),
            Obx(() {
              return Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 16,
                  horizontal: 8,
                ),
                margin: const EdgeInsets.symmetric(vertical: 8),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      spreadRadius: 2,
                      blurRadius: 6,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Text(
                  calculatorController.txtHasil.value.isEmpty
                      ? "Hasil: "
                      : "Hasil: ${calculatorController.txtHasil.value}",
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Colors.blueAccent,
                  ),
                  textAlign: TextAlign.center,
                ),
              );
            }),
            const Padding(padding: EdgeInsets.only(top: 8)),
            SubmitButton(
              label: "Clear",
              labelColor: Colors.red,
              onPressed: () {
                calculatorController.txtAngka1.clear();
                calculatorController.txtAngka2.clear();
                calculatorController.txtHasil.value = "";
              },
            ),
          ],
        ),
      ),
    );
  }
}
