import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:latihan1_11pplg2/widget/btn_submit.dart';
import 'package:latihan1_11pplg2/widget/txt_user.dart';
import '../controllers/contact_controller.dart';

class EditContactPage extends StatelessWidget {
  final controller = Get.find<ContactController>();

  EditContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    final id = Get.arguments as int;
    controller.loadContactForEdit(id);
    return Scaffold(
      appBar: AppBar(title: Text("Edit Contact name")),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TxtUser(
              controller: controller.editNameController,
              labelText: "Name",
              hintText: "Enter contct name",
              isNumber: false,
            ),
            SubmitButton(
              label: "Submit",
              labelColor: Colors.blue,
              onPressed: () {
                controller.updateName(controller.editNameController.toString().trim());
                Get.back();
              },
            ),
          ],
        ),
      ),
    );
  }
}
