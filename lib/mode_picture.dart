import 'package:flutter/material.dart';
import 'package:flutter_projects/main_colors.dart';

class ModePicture extends StatelessWidget {
  final String imagePath;
  final String modeName;

  const ModePicture({Key? key, required this.imagePath, required this.modeName})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(imagePath, width: 100, height: 200),
        const SizedBox(height: 8),
        Text(
          modeName,
          style: const TextStyle(
            fontSize: 16,
            fontFamily: 'Merriweather_Bold',
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}
