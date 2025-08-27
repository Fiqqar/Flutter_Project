import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:latihan1_11pplg2/controllers/edit_football_player_controller.dart';
import 'package:latihan1_11pplg2/widget/btn_submit.dart';
import 'package:latihan1_11pplg2/widget/txt_user.dart';

class EditFootballPlayer extends StatelessWidget {
  EditFootballPlayer({super.key});

  final FootballEditController editController = Get.put(FootballEditController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Edit Football Player")),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TxtUser(
              controller: editController.nameController,
              labelText: "Name",
              hintText: "Enter player name",
              isNumber: false,
            ),
            TxtUser(
              controller: editController.positionController,
              labelText: "Position",
              hintText: "Enter player position",
              isNumber: false,
            ),
            TxtUser(
              controller: editController.playerNumberController,
              labelText: "Player Number",
              hintText: "Enter player number",
              isNumber: true,
            ),
            SubmitButton(
              label: "Submit",
              labelColor: Colors.blue,
              onPressed: () {
                editController.updatePlayer();
                Get.back();
              },
            ),
          ],
        ),
      ),
    );
  }
}
