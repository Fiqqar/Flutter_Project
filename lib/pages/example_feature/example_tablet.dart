import 'package:flutter/material.dart';

class ExampleTablet extends StatelessWidget {
  const ExampleTablet({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Hello World, this is tablet layout")),
      body: Center(child: Text("This is tablet layout")),
    );
  }
}