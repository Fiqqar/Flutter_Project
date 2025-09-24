import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:latihan1_11pplg2/controllers/login_controller.dart';
import 'package:latihan1_11pplg2/widget/btn_submit.dart';
import 'package:latihan1_11pplg2/widget/txt_password.dart';
import 'package:latihan1_11pplg2/widget/txt_user.dart';
import 'package:latihan1_11pplg2/widget/txtv_cstm.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final controller = Get.find<LoginController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomText(
          text: 'Login Page',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Center(
        child: Container(
          margin: EdgeInsets.all(10.0),
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.symmetric(vertical: 4),
                child: CustomText(
                  text: "Welcome to the Login Page",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  ),
                ),
              ),
              CustomText(
                text: 'Please enter your username and password',
                style: TextStyle(fontSize: 16, color: Colors.black54),
              ),
              TxtUser(controller: controller.usernameController, labelText: 'Username', hintText: 'Enter your username', isNumber: false),
              TxtPassword(controller: controller.passwordController, labelText: 'Password', hintText: 'Enter your password'),
              SubmitButton(label: 'Login', labelColor: Colors.black, onPressed: () {
                controller.login();
              })
            ],
          ),
        ),
      ),
    );
  }
}