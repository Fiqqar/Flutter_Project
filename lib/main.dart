import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:latihan1_11pplg2/pages/main_menu_page.dart';
import 'package:latihan1_11pplg2/routes/pages.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      initialRoute: "/",
      getPages: AppPages.pages,
      home: MainMenuPage(),
    );
  }
}
