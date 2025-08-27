import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:latihan1_11pplg2/controllers/main_menu_controller.dart';

class MainMenuPage extends StatelessWidget {
  MainMenuPage({super.key});

  final MainMenuController controller = Get.put(MainMenuController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            Obx(
              () => Column(
                children: controller.menuItems.asMap().entries.map((index) {
                  return ListTile(
                    leading: Icon(index.value["icon"]),
                    title: Text(index.value["title"]),
                    onTap: () {
                      controller.currIndex.value = index.key;
                      Get.back();
                    },
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
      body: Obx(() => controller.pages[controller.currIndex.value]),
    );
  }
}
