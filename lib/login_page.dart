import 'package:flutter/material.dart';
import 'package:latihan1_11pplg2/widget/txtv_cstm.dart';
import 'register_page.dart';

class LoginPage extends StatefulWidget {
  final String? successMessage;

  const LoginPage({super.key, this.successMessage});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String statusLogin = "Login Status : ";
  TextEditingController txtusername = TextEditingController();
  TextEditingController txtpassword = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.successMessage != null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text(widget.successMessage!)));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login Page')),
      body: Container(
        margin: EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
            SizedBox(height: 8),
            Text(
              'Please enter your username and password',
              style: TextStyle(fontSize: 16, color: Colors.black54),
            ),
            Center(
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 4),
                child: Image(
                  image: AssetImage('images/minion.jpg'),
                  height: 200,
                  width: 500,
                ),
              ),
            ),

            Container(
              margin: EdgeInsets.symmetric(vertical: 8),
              child: TextField(
                controller: txtusername,
                decoration: InputDecoration(
                  labelText: 'Username',
                  border: OutlineInputBorder(),
                  hintText: 'Enter your username',
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 16),
              child: TextField(
                controller: txtpassword,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(),
                  hintText: 'Enter your password',
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 8),
              child: ElevatedButton(
                onPressed: () {
                  String username = txtusername.text;
                  String password = txtpassword.text;

                  if (username == 'admin' && password == 'admin') {
                    setState(() {
                      txtusername.clear();
                      txtpassword.clear();
                      statusLogin = "Login Status : Success";
                    });
                  } else {
                    setState(() {
                      txtusername.clear();
                      txtpassword.clear();
                      statusLogin = "Login Status : Failed";
                    });
                  }
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(double.infinity, 50),
                ),
                child: Text('Submit', style: TextStyle(color: Colors.blue)),
              ),
            ),
            Center(
              child: Text(
                statusLogin,
                style: TextStyle(fontSize: 24, color: Colors.red),
              ),
            ),
            Center(
              child: TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => RegisterPage()),
                  );
                },
                child: Text(
                  "Don't have an account? Register here",
                  style: TextStyle(fontSize: 16, color: Colors.blue),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
