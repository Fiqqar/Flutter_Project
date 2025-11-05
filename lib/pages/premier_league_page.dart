import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:latihan1_11pplg2/controllers/premier_league_controller.dart';

class PremierLeaguePage extends StatelessWidget {
  PremierLeaguePage({super.key});

  final controller = Get.put(PremierLeagueController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Premier League Page')),
      body: Container(
        margin: const EdgeInsets.all(10),
        child: Obx(
          () {
            if (controller.isLoading.value) {
              return const Center(child: CircularProgressIndicator());
            }
            return RefreshIndicator(
              onRefresh: () async {
                controller.fetchAPI();
                return Future.value();
              },
              child: ListView.builder(
                physics: const AlwaysScrollableScrollPhysics(),
                itemCount: controller.tableStandings.length,
                itemBuilder: (context, index) {
                  final team = controller.tableStandings[index];
                  return Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    elevation: 2,
                    margin: const EdgeInsets.symmetric(vertical: 6),
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage(team.strBadge),
                      ),
                      title: Text(team.strTeam),
                      subtitle: Text('Points: ${team.intPoints}'),
                      trailing: Text('Position: ${team.intRank}'),
                    ),
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
