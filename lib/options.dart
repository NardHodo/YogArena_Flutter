import 'dart:ffi' hide Size;
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_projects/main_colors.dart';
import 'package:flutter_projects/main_switch.dart';

class OptionsManager extends StatefulWidget {
  const OptionsManager({super.key});

  @override
  State<StatefulWidget> createState() => _OptionsManagerState();
}

class _OptionsManagerState extends State<OptionsManager> {
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
          Options(
            onStart: () => _changeIndex(0),
            pressSounds: () => _changeIndex(1),
            pressNotifications: () => _changeIndex(2),
            pressAccount: () => _changeIndex(3),
            pressCamera: () => _changeIndex(4),
          ),
          OptionSound(onBack: () => _changeIndex(0)),
          OptionsNotifications(onBack: () => _changeIndex(0)),
          OptionsAccount(onBack: () => _changeIndex(0)),
          OptionsCamera(onBack: () => _changeIndex(0)),
        ],
      ),
    );
  }
}

class Options extends StatelessWidget {
  //routes para sa mga option menus
  final VoidCallback onStart;
  final VoidCallback pressSounds;
  final VoidCallback pressNotifications;
  final VoidCallback pressAccount;
  final VoidCallback pressCamera;

  const Options({
    super.key,
    required this.onStart,
    required this.pressSounds,
    required this.pressNotifications,
    required this.pressAccount,
    required this.pressCamera,
  });

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
                    pressSounds();
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
                    pressNotifications();
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
                    pressAccount();
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
                    pressCamera();
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

class OptionSound extends StatelessWidget {
  final VoidCallback onBack;

  const OptionSound({super.key, required this.onBack});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

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
                onPressed: onBack,
                icon: Image.asset('assets/images/back_button_dark.png'),
                iconSize: 50.0,
              ),
            ),
          ),
          Center(
            child: Container(
              height: screenHeight * 0.8,
              width: screenWidth * 0.7,
              padding: const EdgeInsets.all(20.0),
              decoration: BoxDecoration(
                color: MainColors.color_three,
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "Sounds and Display",
                    style: TextStyle(
                      fontFamily: 'Merriweather_Bold',
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 20.0),
                  _buildSliderRow("Master Volume", 1.0),
                  _buildSliderRow("Music", 0.9),
                  _buildSliderRow("SFX", 0.9),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        "In-Game Overlays",
                        style: TextStyle(
                          fontFamily: 'Merriweather_Bold',
                          fontSize: 15,
                          color: Colors.white,
                        ),
                      ),
                      Switch(
                        value: true,
                        onChanged: (val) {},
                        activeColor: MainColors.color_five,
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFD9D9D9),
                          foregroundColor: Colors.black,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        onPressed: () {},
                        child: const Text(
                          "Adjust In-Game UI",
                          style: TextStyle(
                            fontFamily: 'Merriweather_Bold',
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSliderRow(String label, double value) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        children: [
          SizedBox(
            width: 80,
            child: Text(
              label,
              style: TextStyle(
                fontFamily: 'Merriweather_Bold',
                fontSize: 15,
                color: Colors.white,
              ),
            ),
          ),
          Expanded(
            child: SliderTheme(
              data: SliderThemeData(
                trackHeight: 5,
                thumbColor: MainColors.color_five,
                activeTrackColor: Colors.white,
                inactiveTrackColor: Colors.black.withOpacity(0.3),
              ),
              child: Slider(value: value, onChanged: (v) {}),
            ),
          ),
          Text(
            "${(value * 100).round()}%",
            style: TextStyle(
              fontFamily: 'Merriweather_Bold',
              fontSize: 16,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}

class OptionsNotifications extends StatelessWidget {
  final VoidCallback onBack;

  const OptionsNotifications({super.key, required this.onBack});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

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
                onPressed: onBack,
                icon: Image.asset('assets/images/back_button_dark.png'),
                iconSize: 50.0,
              ),
            ),
          ),
          Center(
            child: Container(
              height: screenHeight * 0.8,
              width: screenWidth * 0.7,
              padding: const EdgeInsets.all(20.0),
              decoration: BoxDecoration(
                color: MainColors.color_three,
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "Notifications",
                    style: TextStyle(
                      fontFamily: 'Merriweather_Bold',
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 20.0),
                  Container(
                    padding: const EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: GridView.count(
                      shrinkWrap: true,
                      childAspectRatio: 3,
                      crossAxisCount: 2,
                      children: [
                        MainSwitch(
                          label: "Daily Goals",
                          value: false,
                          onChanged: (value) {},
                        ),
                        MainSwitch(
                          label: "Leaderboards",
                          value: false,
                          onChanged: (value) {},
                        ),
                        MainSwitch(
                          label: "Events",
                          value: false,
                          onChanged: (value) {},
                        ),
                        MainSwitch(
                          label: "Reminders",
                          value: false,
                          onChanged: (value) {},
                        ),
                      ],
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

class OptionsAccount extends StatelessWidget {
  final VoidCallback onBack;

  const OptionsAccount({super.key, required this.onBack});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

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
                onPressed: onBack,
                icon: Image.asset('assets/images/back_button_dark.png'),
                iconSize: 50.0,
              ),
            ),
          ),
          Center(
            child: Container(
              height: screenHeight * 0.8,
              width: screenWidth * 0.7,
              padding: const EdgeInsets.all(20.0),
              decoration: BoxDecoration(
                color: MainColors.color_three,
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: Column(
                children: [
                  Text(
                    "Account",
                    style: TextStyle(
                      fontFamily: 'Merriweather_ExtraBold',
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: double.infinity,
                      width: double.infinity,
                      child: Center(
                        child: ElevatedButton(
                          onPressed: () => debugPrint("Logout"),
                          style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.black,
                            fixedSize: Size(200, 50),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: Text(
                            "Logout Account",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: 'Merriweather_Bold',
                              fontSize: 16,
                              color: Colors.black,
                            ),
                          ),
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

class OptionsCamera extends StatelessWidget {
  final VoidCallback onBack;
  const OptionsCamera({super.key, required this.onBack});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

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
                onPressed: onBack,
                icon: Image.asset('assets/images/back_button_dark.png'),
                iconSize: 50.0,
              ),
            ),
          ),
          Center(
            child: Container(
              height: screenHeight * 0.8,
              width: screenWidth * 0.7,
              padding: const EdgeInsets.all(20.0),
              decoration: BoxDecoration(
                color: MainColors.color_three,
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "Camera",
                    style: TextStyle(
                      fontFamily: 'Merriweather_Bold',
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                  Expanded(
                    child: Center(
                      child: GridView.count(
                        shrinkWrap: true,
                        childAspectRatio: 4.5,
                        crossAxisCount: 2,
                        crossAxisSpacing: 20.0,
                        children: [
                          SizedBox(
                            height: 40,
                            width: 180,
                            child: ElevatedButton(
                              onPressed: () {
                                debugPrint("Test Camera");
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white,
                                foregroundColor: Colors.black,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                              ),
                              child: Text(
                                "Test Camera",
                                style: TextStyle(
                                  fontFamily: 'Merriweather_Bold',
                                  fontSize: 15,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 40,
                            width: 180,
                            child: ElevatedButton(
                              onPressed: () {
                                debugPrint("Video Settings");
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white,
                                foregroundColor: Colors.black,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                              ),
                              child: Text(
                                "Revoke Camera Access",
                                style: TextStyle(
                                  fontFamily: 'Merriweather_Bold',
                                  fontSize: 15,
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
            ),
          ),
        ],
      ),
    );
  }
}
