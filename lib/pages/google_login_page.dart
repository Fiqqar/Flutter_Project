import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:latihan1_11pplg2/controllers/google_login_controller.dart';
import 'package:latihan1_11pplg2/controllers/login_api_controller.dart';
import 'package:latihan1_11pplg2/widget/btn_submit.dart';
import 'package:latihan1_11pplg2/widget/txt_password.dart';
import 'package:latihan1_11pplg2/widget/txt_user.dart';

class GoogleLoginPage extends StatelessWidget {
  GoogleLoginPage({super.key});

  final googleController = Get.put(GoogleLoginController());
  final apiController = Get.put(LoginApiController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Login Page")),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              "Login via API",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            TxtUser(
              controller: apiController.usernameController,
              labelText: 'Username',
              hintText: 'Enter your username',
              isNumber: false,
            ),
            const SizedBox(height: 10),
            TxtPassword(
              controller: apiController.passwordController,
              labelText: 'Password',
              hintText: 'Enter your password',
            ),
            const SizedBox(height: 20),
            Obx(() {
              if (apiController.isLoading.value) {
                return const Center(child: CircularProgressIndicator());
              }
              return SubmitButton(
                label: 'Login',
                labelColor: Colors.black,
                onPressed: () => apiController.login(),
              );
            }),
            const SizedBox(height: 40),

            Row(
              children: const [
                Expanded(child: Divider(thickness: 1)),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Text("Atau login dengan"),
                ),
                Expanded(child: Divider(thickness: 1)),
              ],
            ),
            const SizedBox(height: 20),

            Obx(() {
              if (googleController.isLoading.value) {
                return const Center(child: CircularProgressIndicator());
              }
              return ElevatedButton.icon(
                icon: Image.asset(
                  "images/images.png", // tambahin logo Google di assets
                  height: 24,
                  width: 24,
                ),
                label: const Text("Sign in with Google"),
                onPressed: googleController.signInWithGoogle,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.black,
                  minimumSize: const Size(double.infinity, 50),
                  side: const BorderSide(color: Colors.grey),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}
