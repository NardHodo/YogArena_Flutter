import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_projects/daily_challenges.dart';
import 'package:flutter_projects/main_colors.dart';
import 'dart:math' as math;

import 'package:flutter_projects/options.dart';

class UIManager extends StatefulWidget {
  const UIManager({super.key});

  @override
  State<UIManager> createState() => _UIManagerState();
}

class _UIManagerState extends State<UIManager> {
  int _currentIndex = 0;

  void _changeIndex(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: [
          MainMenu(
            onStart: () => setState(() => _currentIndex = 0),
            onModeSelection: () => setState(() => _changeIndex(1)),
          ),
          ModeSelection(onReturn: () => setState(() => _changeIndex(0))),
        ],
      ),
    );
  }
}

//Main menu screen
class MainMenu extends StatefulWidget {
  final VoidCallback onStart;
  final VoidCallback onModeSelection;
  final String playButton = "PLAY";

  const MainMenu({
    super.key,
    required this.onStart,
    required this.onModeSelection,
  });

  @override
  State<MainMenu> createState() => _MainMenuState();
}

class _MainMenuState extends State<MainMenu> {
  int _currentScreenIndex = 0;

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
                          onPressed: widget.onModeSelection,
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
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const Options(),
                              ),
                            );
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
                                    showDialog(
                                      context: context,
                                      builder: (context) {
                                        return const DailiesDialog();
                                      },
                                    );
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
//main menu end

//mode selection start
class ModeSelection extends StatelessWidget {
  final VoidCallback onReturn;

  const ModeSelection({super.key, required this.onReturn});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(
      context,
    ).size.width; //overall width ng screen
    double customWidth = screenWidth * 0.45; // 45% of the overall width
    double placeHolderWidth = screenWidth * 0.15; // 20% of the overall width

    double screenHeight = MediaQuery.of(context).size.height;
    double bottomPadding = MediaQuery.of(context).padding.bottom;
    double bottomPlacing = bottomPadding + 20;
    double placeHolderHeight = screenHeight * 0.75;

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
            top: 27.0,
            left: 27.0,
            child: SizedBox(
              height: 50,
              width: 50,
              child: IconButton(
                onPressed: onReturn,
                icon: Image.asset('assets/images/back_button_dark.png'),
                iconSize: 50.0,
              ),
            ),
          ),
          Positioned(
            top: 27.0,
            right: 27.0,
            child: SizedBox(
              height: 50,
              width: 50,
              child: IconButton(
                onPressed: null,
                icon: Image.asset('assets/images/help_icon.png'),
                iconSize: 50.0,
              ),
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: SizedBox(
              height: 70,
              width: 250,
              child: Container(
                margin: EdgeInsets.only(top: 27.0),
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                      'assets/images/mode_selection_header.png',
                    ),
                    fit: BoxFit.fill,
                  ),
                ),
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    "Select Mode",
                    style: TextStyle(
                      fontFamily: 'Merriweather_Bold',
                      fontSize: 20.0,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Center(
            child: Container(
              margin: EdgeInsetsDirectional.symmetric(
                horizontal: 150.0,
                vertical: 80.0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                spacing: 50.0,
                children: [
                  SizedBox(
                    height: double.infinity,
                    width: placeHolderWidth,
                    child: IconButton(
                      padding: EdgeInsets.all(0),
                      onPressed: () {
                        debugPrint("Practice Arena");
                      },
                      icon: Image.asset(
                        'assets/images/mode_selection_placeholder_1.png',
                        fit: BoxFit.cover,
                        height: double.infinity,
                        width: double.infinity,
                      ),
                      iconSize: 20.0,
                      style: IconButton.styleFrom(
                        elevation: 1,
                        shadowColor: const Color.fromARGB(127, 158, 158, 158),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(0.0),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: double.infinity,
                    width: placeHolderWidth,
                    child: IconButton(
                      padding: EdgeInsets.all(0),
                      onPressed: () {
                        debugPrint("Practice Arena");
                      },
                      icon: Image.asset(
                        'assets/images/mode_selection_placeholder_2.png',
                        fit: BoxFit.cover,
                        height: double.infinity,
                        width: double.infinity,
                      ),
                      style: IconButton.styleFrom(
                        elevation: 1,
                        shadowColor: const Color.fromARGB(127, 158, 158, 158),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(0.0),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class DailiesDialog extends StatefulWidget {
  const DailiesDialog({super.key});

  @override
  State<DailiesDialog> createState() => _DailiesDialogState();
}

class _DailiesDialogState extends State<DailiesDialog> {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    double dialogHeight = screenHeight * 0.95;
    double dialogWidth = screenWidth * 0.95;

    return Dialog(
      child: Container(
        height: dialogHeight,
        width: dialogWidth,
        decoration: BoxDecoration(
          color: MainColors.color_three,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          children: [
            Expanded(
              flex: 6,
              child: Container(
                margin: const EdgeInsets.all(15.0),
                child: Column(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Center(
                        child: Text(
                          "Select Challenges for your Dailies",
                          style: TextStyle(
                            fontFamily: 'Merriweather_Bold',
                            fontSize: 17,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    //bawal positioned widget sa loob ng row (noted)
                    Expanded(
                      flex: 1,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Available Challenges:",
                            style: TextStyle(
                              fontFamily: 'Nunito_Bold',
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(
                            height: 40,
                            width: 40,
                            child: IconButton(
                              onPressed: () {
                                debugPrint("Test");
                              },
                              icon: Image.asset('assets/images/shuffle.png'),
                              style: IconButton.styleFrom(
                                backgroundColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 6,
                      child: Row(
                        children: [
                          DailyChallenges(
                            challengeId: 177013,
                            challengeName: "Finish 1 YogArena Routine",
                            difficulty: 2,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(flex: 4, child: Container(color: Colors.blue)),
          ],
        ),
      ),
    );
  }
}

// dailies dialog end
