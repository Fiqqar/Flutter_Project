import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:latihan1_11pplg2/controllers/login_api_controller.dart';
import 'package:latihan1_11pplg2/controllers/notifications_controller.dart';
import 'package:latihan1_11pplg2/widget/btn_submit.dart';
import 'package:latihan1_11pplg2/widget/txt_password.dart';
import 'package:latihan1_11pplg2/widget/txt_user.dart';
import 'package:latihan1_11pplg2/widget/txtv_cstm.dart';

class LoginApiPage extends StatelessWidget {
  LoginApiPage({super.key});

  final controller = Get.find<LoginApiController>();
  final c = Get.put(NotificationController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomText(
          text: 'Login using API',
          style: const TextStyle(color: Colors.white),
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomText(
                  text: "Welcome to the Login Page",
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  ),
                ),
                const SizedBox(height: 10),
                CustomText(
                  text: 'Please enter your username and password',
                  style: const TextStyle(fontSize: 16, color: Colors.black54),
                ),
                const SizedBox(height: 20),
                TxtUser(
                  controller: controller.usernameController,
                  labelText: 'Username',
                  hintText: 'Enter your username',
                  isNumber: false,
                ),
                TxtPassword(
                  controller: controller.passwordController,
                  labelText: 'Password',
                  hintText: 'Enter your password',
                ),
                const SizedBox(height: 30),

                Obx(() {
                  if (controller.isLoading.value) {
                    return const CircularProgressIndicator();
                  } else {
                    return SubmitButton(
                      label: 'Login',
                      labelColor: Colors.black,
                      onPressed: () {
                        controller.login();
                      },
                    );
                  }
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
