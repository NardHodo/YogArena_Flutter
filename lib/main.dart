import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_projects/camera_permissions.dart';
import 'package:flutter_projects/loading_screen.dart';
import 'package:flutter_projects/login_registration.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:flutter_projects/main_colors.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight
    ]);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class BlankWhiteTransition extends StatefulWidget{
  const BlankWhiteTransition({super.key});

  @override
  State<BlankWhiteTransition> createState() => _BlankTransitionScreenState();
}

class _BlankTransitionScreenState extends State<BlankWhiteTransition>{
  @override
  void initState(){
    super.initState();

    Future.delayed(const Duration(milliseconds: 1000), (){
      Navigator.pushReplacement(
        context,
        PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) =>
              const Login_Registration(),
          transitionsBuilder: (context, animation, secondaryAnimation, child){
            return FadeTransition(opacity: animation, child: child);
          },
          transitionDuration: const Duration(milliseconds: 800),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext){
    return const Scaffold(
      backgroundColor: MainColors.color_one,
      body: SizedBox.expand(),
    );
  }
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateAfterDelay();
  }

  Future<void> _navigateAfterDelay() async {
    await Future.delayed(const Duration(seconds: 3));

    final cameraStatus = await Permission.camera.status;

    if (cameraStatus.isGranted) {
      Navigator.pushReplacement(
        context,
        PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) => const Login_Registration(),
          transitionsBuilder: (context, animation, secondaryAnimation, child){
            return FadeTransition(opacity: animation, child: child,);
          },
          transitionDuration: const Duration(milliseconds: 500),
        ),
      );
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const CameraPermissionScreen(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Image.asset(
          'assets/images/main_title_logo.png',
          width: 350,
          height: 350,
          fit: BoxFit.contain,
          alignment: Alignment.center,
        ),
      ),
    );
  }
}

class MainAppScreen extends StatelessWidget {
  const MainAppScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          '🎥 Camera Permission Already Granted!',
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
