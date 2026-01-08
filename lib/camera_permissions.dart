import 'package:flutter/material.dart';
import 'package:flutter_projects/login_registration.dart';
import 'package:permission_handler/permission_handler.dart';

import 'main_colors.dart';

class CameraPermissionScreen extends StatefulWidget {
  const CameraPermissionScreen({super.key});

  @override
  State<CameraPermissionScreen> createState() => _CameraPermissionPageState();
}

class _CameraPermissionPageState extends State<CameraPermissionScreen> {
  String _statusText = "Camera permission not requested yet";

  Future<void> _requestCameraPermission() async {
    debugPrint('Allow Camera Pressed');
    final status = await Permission.camera.request();

    if (status.isGranted) {
      setState(() {
        _statusText = "✅ Camera permission granted!";
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => Login_Registration()),
        );
      });
    } else if (status.isDenied) {
      setState(() {
        _statusText = "Camera permission denied.";
      });
    } else if (status.isPermanentlyDenied) {
      setState(() {
        _statusText = "Permanently denied — open settings to enable.";
      });
      openAppSettings();
    }
  }

  void _onExitPressed() {
    debugPrint('On Exit Pressed');
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final topSpacerHeight = screenHeight * 0.10;
    final bottomSpacerHeight = screenHeight * 0.10;

    const Color color4 = Color(0xFFEFEFEF); // Placeholder for color_4
    const Color color1 = Color(0xFF42A5F5); // Placeholder for color_1 (Blue)
    const headerText = "CAMERA PERMISSION REQUIRED";

    return Scaffold(
      backgroundColor: color4,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SizedBox(height: topSpacerHeight),

          Image.asset(
            'assets/images/camera_permission_icon.png',
            height: 50,
            fit: BoxFit.contain,
          ),

          const SizedBox(height: 32),

          const Text(
            headerText,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 20, fontFamily: 'Nunito_Bold'),
          ),

          const Spacer(),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50.0),
            child: Text(
              'To full unlock you YogArena experience, the application needs an access to your camera'
              'This allows the app to detect your overall form and movement in order to provide accurate'
              'feedback and measure your overall performance. Camera Access is fully required in order to proceed',
              textAlign: TextAlign.center,
              style: const TextStyle(fontFamily: 'Nunito_Medium', fontSize: 16),
            ),
          ),

          const Spacer(),

          Padding(
            padding: const EdgeInsets.only(bottom: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 15.0,
                  ), // layout_marginHorizontal="15sp"
                  child: SizedBox(
                    width: 150,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: _onExitPressed,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: MainColors
                            .color_three, // app:backgroundTint="@color/color_1"
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                            15.0,
                          ), // app:cornerRadius="15dp"
                        ),
                      ),
                      child: const Text(
                        'Exit Game', // @string/not_now
                        style: TextStyle(
                          fontFamily: 'Merriweather_Bold',
                          color: Colors
                              .white, // Ensure text is visible on the button color
                        ),
                      ),
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 15.0,
                  ), // layout_marginHorizontal="15sp"
                  child: SizedBox(
                    width: 150,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: _requestCameraPermission,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: MainColors
                            .color_five, // app:backgroundTint="@color/color_1"
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                            15.0,
                          ), // app:cornerRadius="15dp"
                        ),
                      ),
                      child: const Text(
                        'Allow Access',
                        style: TextStyle(
                          fontFamily: 'Merriweather_Bold',
                          color: Colors.white,
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: bottomSpacerHeight),
        ],
      ),
    );
  }
}
