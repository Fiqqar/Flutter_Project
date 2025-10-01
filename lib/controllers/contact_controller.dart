import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../helper/db_helper.dart';

class ContactController extends GetxController {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController editNameController = TextEditingController();
  final names = <Map<String, dynamic>>[].obs;
  final _dbHelper = DBHelper();

  @override
  void onInit() {
    super.onInit();
    fetchNames();
  }

  Future<void> fetchNames() async {
    final data = await _dbHelper.getNames();
    names.value = data;
  }

  Future<void> addName() async {
    final text = nameController.text.trim();
    if (text.isEmpty) return;
    await _dbHelper.insertName(text);
    nameController.clear();
    fetchNames();
  }

  Future<void> updateName(int id, String newName) async {
    await _dbHelper.updateName(id, newName);
    editNameController.clear();
    fetchNames();
  }

  Future<void> deleteName(int id) async {
    await _dbHelper.deleteName(id);
    fetchNames();
  }

  Future<void> showEditDialog(int id, String oldName) async {
  editNameController.text = oldName;

  Get.defaultDialog(
    title: "Edit Contact",
    content: TextField(
      controller: editNameController,
      decoration: InputDecoration(
        hintText: "Enter new name",
        border: OutlineInputBorder(),
      ),
    ),
    textConfirm: "Update",
    textCancel: "Cancel",
    confirmTextColor: Colors.white,
    onConfirm: () async {
      final newName = editNameController.text.trim();
      if (newName.isNotEmpty) {
        await updateName(id, newName);
      }
      Get.back();
    },
    onCancel: () {
      editNameController.clear();
    },
  );
}


  @override
  void onClose() {
    nameController.dispose();
    editNameController.dispose();
    super.onClose();
  }
}
