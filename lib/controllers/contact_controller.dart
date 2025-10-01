import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../helper/db_helper.dart';

class ContactController extends GetxController {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController editNameController = TextEditingController();
  final names = <Map<String, dynamic>>[].obs;
  final _dbHelper = DBHelper();

  int? id;

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

  Future<void> updateName(String newName) async {
    if (id == null) {
      print("id nya null");
      return;
    }
    if (newName.isEmpty) {
      print("name nya null");
      return;
    }
    await _dbHelper.updateName(id!, newName);
    editNameController.clear();
    id = null;
    fetchNames();
  }

  Future<void> deleteName(int id) async {
    await _dbHelper.deleteName(id);
    fetchNames();
  }

  void loadContactForEdit(int id) {
    final contact = names.firstWhere((e) => e['id'] == id);
    id = contact['id'];
    editNameController.text = contact['name'];
  }

  @override
  void onClose() {
    nameController.dispose();
    editNameController.dispose();
    super.onClose();
  }
}
