import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:latihan1_11pplg2/controllers/football_player_controller.dart';
import 'package:latihan1_11pplg2/routes/routes.dart';

class FootballPlayer extends StatelessWidget {
  FootballPlayer({super.key});

  final FootballPlayerController footballPlayerController = Get.put(FootballPlayerController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Football Players"),),
      body: Container(
        margin: EdgeInsets.all(10),
        child: Obx(() => ListView.builder(
          itemCount: footballPlayerController.players.length,
          itemBuilder: (context, index) {
            final player = footballPlayerController.players[index];
            return Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                elevation: 2,
                margin: const EdgeInsets.symmetric(vertical: 6),
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundImage: AssetImage(player.profileImage),
                  ),
                  title: Text(player.name),
                  subtitle: Text(player.position),
                  trailing: Text("${player.playerNumber}"),
                  onTap: () {
                    Get.toNamed(AppRoutes.editFootballPage, arguments: {'index': index});
                  },
                ),
            );
          }
        )),
      ),
    );
  }
}