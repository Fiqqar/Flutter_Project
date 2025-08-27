import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:latihan1_11pplg2/controllers/football_player_controller.dart';
import '../models/player_model.dart';

class FootballEditController extends GetxController {
  final footballController = Get.find<FootballPlayerController>();

  final nameController = TextEditingController();
  final positionController = TextEditingController();
  final playerNumberController = TextEditingController();

  late int index;

  @override
  void onInit() {
    super.onInit();
    load();
  }

  void load() {
    index = Get.arguments as int;
    final player = footballController.players[index];
    nameController.text = player.name;
    positionController.text = player.position;
    playerNumberController.text = player.playerNumber.toString();
  }

  void updatePlayer() {
    final updatedPlayer = Player(
      profileImage: footballController.players[index].profileImage,
      name: nameController.text,
      position: positionController.text,
      playerNumber: int.tryParse(playerNumberController.text) ?? 0,
    );
    footballController.players[index] = updatedPlayer;
  }
}
