import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_projects/main_colors.dart';

class DailyChallenges extends StatelessWidget {
  final int challengeId;
  final String challengeName;
  final int difficulty;

  DailyChallenges({
    super.key,
    required this.challengeId,
    required this.challengeName,
    required this.difficulty,
  });

  @override
  Widget build(BuildContext context) {
    return Draggable(
      data: challengeName,
      feedback: Material(color: Colors.white, child: _buildCard(opacity: 0.8)),

      childWhenDragging: _buildCard(opacity: 0.3),

      child: _buildCard(),
    );
  }

  Widget _buildCard({double opacity = 1.0}) {
    return Opacity(
      opacity: opacity,
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(10.0),
        ),
        color: MainColors.color_seven,
        child: Container(
          width: 200,
          height: 50,
          alignment: Alignment.center,
          child: Text(
            challengeName,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.white,
              fontFamily: 'Nunito_Bold',
              fontSize: 15,
            ),
          ),
        ),
      ),
    );
  }
}
