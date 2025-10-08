import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:latihan1_11pplg2/models/player_model.dart';

class FootballPlayerController extends GetxController {
  var isMobile = true.obs;

  void updateLayout(BoxConstraints constraints) {
    isMobile.value = constraints.maxWidth < 600;
  }

  var players = <Player>[
    Player(
      profileImage:"images/gonzalo.jpg",
      name: "Gonzalo Garcia",
      position: "ST/CAM/CF",
      playerNumber: 16,
    ),
    Player(
      profileImage:"images/luka.jpg",
      name: "Luka Modric",
      position: "CM/CDM/CAM",
      playerNumber: 14,
    ),
    Player(
      profileImage:"images/cole.jpg",
      name: "Cole Palmer",
      position: "CAM/RW/LW",
      playerNumber: 10,
    ),
    Player(
      profileImage:"images/charles.jpg",
      name: "Charles Leclerc",
      position: "Any",
      playerNumber: 16,
    ),
    Player(
      profileImage:"images/amir.jpg",
      name: "Amir Fattah",
      position: "GK",
      playerNumber: 67,
    ),
  ].obs;


}
