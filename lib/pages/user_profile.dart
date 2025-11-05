import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:latihan1_11pplg2/controllers/profile_controller.dart';

class UserProfile extends StatelessWidget {
  UserProfile({super.key});

  final controller = Get.find<ProfileController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("User Profile"), centerTitle: true),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Column(
            children: [
              CircleAvatar(
                radius: 50,
                backgroundImage: controller.photoUrl.value.isNotEmpty
                    ? NetworkImage(controller.photoUrl.value)
                    : AssetImage("images/profile.jpeg") as ImageProvider,
              ),
              Padding(
                padding: EdgeInsets.only(top: 16),
                child: Obx(
                  () => Text(
                    controller.name.value.isNotEmpty ? controller.name.value : "Zulfiqar Silmy Setiawan",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 4),
                child: Obx(
                  () => Text(
                    controller.email.value.isNotEmpty ? controller.email.value : "05570@smkrus.sch.id",
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
              ),
            ],
          ),

          const Padding(
            padding: EdgeInsets.symmetric(vertical: 20),
            child: Divider(),
          ),

          Card(
            child: ListTile(
              leading: const Icon(Icons.person),
              title: const Text("Nama Lengkap"),
              subtitle: const Text("Zulfiqar Silmy Setiawan"),
              trailing: IconButton(
                icon: const Icon(Icons.edit),
                onPressed: () => Get.snackbar("Edit", "Edit nama user"),
              ),
            ),
          ),
          Card(
            child: ListTile(
              leading: const Icon(Icons.phone),
              title: const Text("Nomor Telepon"),
              subtitle: const Text("+62 891 9281 9283"),
              trailing: IconButton(
                icon: const Icon(Icons.edit),
                onPressed: () => Get.snackbar("Edit", "Edit nomor telepon"),
              ),
            ),
          ),
          Card(
            child: ListTile(
              leading: const Icon(Icons.home),
              title: const Text("Alamat"),
              subtitle: const Text("Jl. Sukun Raya Besito Gg. Teratai"),
              trailing: IconButton(
                icon: const Icon(Icons.edit),
                onPressed: () => Get.snackbar("Edit", "Edit alamat"),
              ),
            ),
          ),

          const Padding(
            padding: EdgeInsets.symmetric(vertical: 20),
            child: Divider(),
          ),

          ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
              minimumSize: const Size(double.infinity, 50),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            onPressed: () => controller.logout(),
            icon: const Icon(Icons.logout),
            label: const Text("Logout", style: TextStyle(color: Colors.black)),
          ),
        ],
      ),
    );
  }
}
