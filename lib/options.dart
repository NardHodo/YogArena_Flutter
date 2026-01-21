import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_projects/main_colors.dart';

class Options extends StatelessWidget {
  const Options({super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double spacing = screenHeight * 0.05;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/options_bg.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
              child: Container(color: Colors.black.withOpacity(0.1)),
            ),
          ),
          Positioned(
            top: 27.0,
            left: 27.0,
            child: SizedBox(
              height: 50,
              width: 50,
              child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Image.asset('assets/images/back_button_dark.png'),
                iconSize: 50.0,
              ),
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    debugPrint("Nigga");
                  },
                  style: ElevatedButton.styleFrom(
                    fixedSize: const Size(250, 50),
                    backgroundColor: MainColors.color_seven,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  child: Text(
                    "Sounds and Display",
                    style: TextStyle(
                      fontFamily: 'Merriweather_Bold',
                      fontSize: 16,
                    ),
                  ),
                ),
                //SPACING
                //needs to be responsive
                SizedBox(height: spacing),

                ElevatedButton(
                  onPressed: () {
                    debugPrint("Nigga");
                  },
                  style: ElevatedButton.styleFrom(
                    fixedSize: const Size(250, 50),
                    backgroundColor: MainColors.color_seven,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  child: Text(
                    "Notifications",
                    style: TextStyle(
                      fontFamily: 'Merriweather_Bold',
                      fontSize: 16,
                    ),
                  ),
                ),

                SizedBox(height: spacing),

                //spacing again (needs to be responsive)
                ElevatedButton(
                  onPressed: () {
                    debugPrint("Nigga");
                  },
                  style: ElevatedButton.styleFrom(
                    fixedSize: const Size(250, 50),
                    backgroundColor: MainColors.color_seven,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  child: Text(
                    "Account",
                    style: TextStyle(
                      fontFamily: 'Merriweather_Bold',
                      fontSize: 16,
                    ),
                  ),
                ),

                SizedBox(height: spacing),

                ElevatedButton(
                  onPressed: () {
                    debugPrint("Nigga");
                  },
                  style: ElevatedButton.styleFrom(
                    fixedSize: const Size(250, 50),
                    backgroundColor: MainColors.color_seven,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  child: Text(
                    "Camera",
                    style: TextStyle(
                      fontFamily: 'Merriweather_Bold',
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
//options end