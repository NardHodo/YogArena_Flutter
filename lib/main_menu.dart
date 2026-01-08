import 'package:flutter/material.dart';
import 'package:flutter_projects/main_colors.dart';

class MainMenu extends StatefulWidget {
  const MainMenu({super.key});
  final String playButton = "PLAY";

  @override
  State<MainMenu> createState() => _MainMenuState();
}

class _MainMenuState extends State<MainMenu> {
  @override
  Widget build(BuildContext) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/main_menu_bg.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            left: 30.0,
            top: 30.0,
            child: ElevatedButton(
              onPressed: () {
                debugPrint("Profile Button Pressed");
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: MainColors.color_three,
                foregroundColor: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
              ),
              child: SizedBox(
                height: 50,
                width: 140,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 2,
                      child: Image.asset('assets/images/profile_icon_one.png'),
                    ),
                    //horizontal spacing
                    SizedBox(width: 20),

                    Padding(
                      padding: EdgeInsetsGeometry.symmetric(
                        horizontal: 5.0,
                        vertical: 15.0,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Text(
                            "Player Name",
                            style: TextStyle(
                              fontFamily: 'Merriweather_Regular',
                            ),
                          ),
                          SizedBox(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: 30.0,
            right: 30.0,
            child: ElevatedButton(
              onPressed: () {
                debugPrint("Settings Button Pressed");
              },
              child: const Text("Settings Button"),
            ),
          ),
          Positioned(
            bottom: 30.0,
            right: 30.0,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6.0),
                ),
                foregroundColor: Colors.black,
                fixedSize: const Size(150, 50),
              ),
              onPressed: () {
                debugPrint("Play Button Pressed");
              },
              child: const Text(
                "PLAY",
                style: TextStyle(
                  fontFamily: 'Merriweather_Bold',
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
