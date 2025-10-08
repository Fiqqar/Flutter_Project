import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:latihan1_11pplg2/controllers/football_player_controller.dart';
import 'package:latihan1_11pplg2/routes/routes.dart';

class FootballPageWidescreen extends StatelessWidget {
  FootballPageWidescreen({super.key});
  final footballPlayerController = Get.find<FootballPlayerController>();

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Text("Football Players Widescreen"),
        backgroundColor: Colors.white,
        elevation: 5,
      ),
      body: Obx(() {
        return GridView.builder(
          padding: const EdgeInsets.all(16),
          itemCount: footballPlayerController.players.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: screenWidth > 1000 ? 4 : 2,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            childAspectRatio: 3 / 2,
          ),
          itemBuilder: (context, index) {
            final player = footballPlayerController.players[index];
            return GestureDetector(
              onTap: () {
                Get.toNamed(AppRoutes.editFootballPage, arguments: index);
              },
              child: Card(
                elevation: 6,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: 35,
                        backgroundImage: AssetImage(player.profileImage),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        player.name,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        "${player.position} | No. ${player.playerNumber}",
                        style: TextStyle(color: Colors.grey[700], fontSize: 13),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 8),
                      const Icon(Icons.edit, color: Colors.blueAccent),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      }),
    );
  }
}
