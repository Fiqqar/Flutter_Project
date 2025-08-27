import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:latihan1_11pplg2/controllers/main_menu_controller.dart';

class MainMenuPage extends StatelessWidget {
  MainMenuPage({super.key});

  final MainMenuController controller = Get.put(MainMenuController());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: AppBar(backgroundColor: Colors.blueAccent),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              const UserAccountsDrawerHeader(
                decoration: BoxDecoration(color: Colors.blueAccent),
                accountName: Text(
                  "Zulfiqar",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                accountEmail: Text("fiqarsilmy@gmail.com"),
                currentAccountPicture: CircleAvatar(
                  backgroundImage: AssetImage("images/profile.jpeg"),
                ),
              ),
              ...controller.menuItems.asMap().entries.map((idx) {
                return ListTile(
                  leading: Icon(idx.value["icon"]),
                  title: Text(idx.value["title"]),
                  onTap: () {
                    controller.currIndex.value = idx.key;
                    Get.back();
                  },
                );
              }),
            ],
          ),
        ),
        body: controller.pages[controller.currIndex.value],
      ),
    );
  }
}
