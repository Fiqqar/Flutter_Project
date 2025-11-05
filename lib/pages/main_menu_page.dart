import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:latihan1_11pplg2/controllers/main_menu_controller.dart';
import 'package:latihan1_11pplg2/controllers/profile_controller.dart';

class MainMenuPage extends StatelessWidget {
  MainMenuPage({super.key});

  final MainMenuController controller = Get.put(MainMenuController());
  final ProfileController controller2 = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: AppBar(backgroundColor: Colors.blueAccent),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              UserAccountsDrawerHeader(
                decoration: BoxDecoration(color: Colors.blueAccent),
                accountName: Obx(
                  () => Text(
                    controller2.name.value.isNotEmpty
                        ? controller2.name.value
                        : "No Name",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                accountEmail: Obx(
                  () => Text(
                    controller2.email.value.isNotEmpty
                        ? controller2.email.value
                        : "No Email",
                  ),
                ),
                currentAccountPicture: Obx(
                  () => CircleAvatar(
                    backgroundImage: controller2.photoUrl.value.isNotEmpty
                        ? NetworkImage(controller2.photoUrl.value)
                        : AssetImage("images/profile.jpeg") as ImageProvider,
                  ),
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
