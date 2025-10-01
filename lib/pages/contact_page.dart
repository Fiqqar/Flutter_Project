import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:latihan1_11pplg2/controllers/contact_controller.dart';

class ContactPage extends StatelessWidget {
  ContactPage({super.key});

  final controller = Get.find<ContactController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Contacts")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: controller.nameController,
                    decoration: const InputDecoration(
                      hintText: "Input name",
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: controller.addName,
                  child: Icon(Icons.add),
                ),
              ],
            ),
            
            Expanded(
              child: Obx(() {
                if (controller.names.isEmpty) {
                  return const Center(child: Text("Belum ada contact"));
                }
                return ListView.builder(
                  itemCount: controller.names.length,
                  itemBuilder: (context, index) {
                    final item = controller.names[index];
                    return ListTile(
                      hoverColor: Colors.grey,
                      leading: IconButton(onPressed: () {
                        controller.showEditDialog(item['id'], item['name']);
                      }, icon: Icon(Icons.edit)),
                      title: Text(item['name']),
                      trailing: IconButton(onPressed: () {
                        controller.deleteName(item['id']);
                      }, icon: Icon(Icons.delete, color: Colors.red))
                      
                    );
                  },
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
