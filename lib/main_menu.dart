import 'package:flutter/material.dart';
import 'package:flutter_projects/main_colors.dart';
import 'dart:math' as math;

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
            right: 45,
            top: 50,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SizedBox(
                  height:
                      75.0, //needs to be responsive since magiging maliit siya sa malalaking screen
                  width: 200.0,
                  child: Transform.rotate(
                    angle: -3 * (math.pi / 180),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        IconButton(
                          padding: EdgeInsets.zero,
                          onPressed: () {
                            debugPrint("Play Button Pressed");
                          },
                          icon: Image.asset('assets/images/play_button.png'),
                          iconSize: 20.0,
                          style: IconButton.styleFrom(
                            elevation: 10,
                            shadowColor: const Color.fromARGB(
                              127,
                              158,
                              158,
                              158,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(0.0),
                            ),
                          ),
                        ),
                        IgnorePointer(
                          child: Text(
                            "PLAY",
                            style: TextStyle(
                              fontSize: 27,
                              fontFamily: 'Merriweather_Bold',
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 50),

                SizedBox(
                  height: 60.0, //needs to be responsive
                  width: 160.0,
                  child: Transform.rotate(
                    angle: 3 * (math.pi / 180),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        IconButton(
                          padding: EdgeInsets.zero,
                          onPressed: () {
                            debugPrint("Tutorial Button Pressed");
                          },
                          icon: Image.asset(
                            'assets/images/tutorial_button.png',
                          ),
                          iconSize: 20.0,
                          style: IconButton.styleFrom(
                            elevation: 10,
                            shadowColor: const Color.fromARGB(
                              127,
                              158,
                              158,
                              158,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(0.0),
                            ),
                          ),
                        ),
                        IgnorePointer(
                          //kasi nag o overlap yung hitbox nung text sa button
                          child: Text(
                            "Tutorials",
                            style: TextStyle(
                              fontFamily: 'Merriweather_Bold',
                              fontSize: 17,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                SizedBox(height: 30),

                SizedBox(
                  height: 60.0, //needs to be responsive
                  width: 160.0,
                  child: Transform.rotate(
                    angle: -3 * (math.pi / 180),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        IconButton(
                          padding: EdgeInsets.zero,
                          onPressed: () {
                            debugPrint("Options Button Pressed");
                          },
                          icon: Image.asset('assets/images/options_button.png'),
                          iconSize: 20.0,
                          style: IconButton.styleFrom(
                            elevation: 5,
                            shadowColor: const Color.fromARGB(
                              127,
                              158,
                              158,
                              158,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(0.0),
                            ),
                          ),
                        ),
                        IgnorePointer(
                          //kasi nag o overlap yung hitbox nung text sa button
                          child: Text(
                            "Options",
                            style: TextStyle(
                              fontFamily: 'Merriweather_Bold',
                              fontSize: 17,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 45.0, top: 50.0, bottom: 50.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: FractionallySizedBox(
                widthFactor: 0.6,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Expanded(
                      flex: 5,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(2),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 5,
                      child: Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/images/dailies_bg.png'),
                          ),
                          color: MainColors.dailiesBg,
                          borderRadius: BorderRadius.circular(2),
                          border: Border.all(
                            color: MainColors.dailiesBorder,
                            width: 3.0,
                          ),
                        ),
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: 100,
                                height: 100,
                                child: IconButton(
                                  padding: EdgeInsets.all(10.0),
                                  onPressed: () {
                                    debugPrint("Add Button Pressed");
                                  },
                                  icon: Image.asset(
                                    'assets/images/add_dailies.png',
                                  ),
                                ),
                              ),
                              Text(
                                "Create your own Daily Goal Sets",
                                style: TextStyle(
                                  fontFamily: 'Nunito_Bold',
                                  fontSize: 15.0,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
