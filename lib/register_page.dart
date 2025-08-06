import 'package:flutter/material.dart';
import 'package:latihan1_11pplg2/widget/btn_submit.dart';
import 'package:latihan1_11pplg2/widget/txtv_cstm.dart';
import 'widget/txt_email.dart';
import 'widget/txt_password.dart';
import 'widget/txt_user.dart';
import 'widget/radio_gender.dart';
import 'widget/date_birth.dart';
import 'login_page.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController dateController = TextEditingController();

  String jenisKelamin = '';
  String successMessage = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Register')),
      body: Container(
        margin: const EdgeInsets.symmetric(vertical: 16),
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText(
              text: "Register Page",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 8),
              child: TxtUser(
                isNumber: false,
                controller: usernameController,
                labelText: 'Username',
                hintText: 'Enter your username',
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 8),
              child: TxtEmail(
                controller: emailController,
                labelText: 'Email',
                hintText: 'Enter your email',
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 8),
              child: TxtPassword(
                controller: passwordController,
                labelText: 'Password',
                hintText: 'Enter your password',
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 8),
              child: RadioGender(
                groupValue: jenisKelamin,
                onChanged: (value) {
                  setState(() {
                    jenisKelamin = value ?? '';
                  });
                },
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 8),
              child: DateBirth(
                controller: dateController,
                labelText: "Birth Date",
                hintText: "Enter your birth date",
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 16),
              child: SubmitButton(
                label: "Register",
                labelColor: Colors.blue,
                btnStyle: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  side: BorderSide(color: Colors.blue, width: 2),
                  minimumSize: Size(double.infinity, 50),
                ),
                onPressed: () {
                  String username = usernameController.text;
                  String email = emailController.text;
                  String password = passwordController.text;
                  String birthDate = dateController.text;

                  if (username.isEmpty ||
                      email.isEmpty ||
                      password.isEmpty ||
                      birthDate.isEmpty ||
                      jenisKelamin.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Please fill all fields')),
                    );
                    return;
                  } else {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LoginPage(
                          successMessage: 'Registration Successful!',
                        ),
                      ),
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
