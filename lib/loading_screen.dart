import 'package:flutter/material.dart';
import 'package:flutter_projects/login_registration.dart';
import 'package:flutter_projects/main_colors.dart';
import 'package:flutter_projects/profiling_survey.dart';

class LoadingIndicator extends StatefulWidget {
  const LoadingIndicator({super.key});

  @override
  State<LoadingIndicator> createState() => _LoadingIndicatorState();
}

class _LoadingIndicatorState extends State<LoadingIndicator> {
  bool _isLoading = false;
  double _progressValue = 0.0;

  @override
  void initState() {
    super.initState();
    _startLoading();
  }

  Future<void> _startLoading() async {
    setState(() {
      _isLoading = true;
      _progressValue = 0.0;
    });

    const int totalSteps = 10; //loading steps

    for (int step = 1; step <= totalSteps; step++) {
      await Future.delayed(const Duration(milliseconds: 300));
      double newProgress = step / totalSteps;

      setState(() {
        //update loading
        _progressValue = newProgress;
      });
    }

    setState(() {
      // stop when done
      _isLoading = false;
    });


    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const Login_Registration()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MainColors.color_one, // color_4
      body: Stack(
        children: [
          Center(
            child: Container(
              height: 170,
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 50),
              color: MainColors.color_three,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const SizedBox(height: 0.5),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "Did you know?", // @string/did_you_know
                        style: const TextStyle(
                          fontFamily: 'Merriweather_Bold',
                          fontSize: 19,
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 40),
                      Text(
                        "TRIVIA", // @string/trivia_header
                        style: const TextStyle(
                          fontFamily: 'Nunito_Bold',
                          fontSize: 16,
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 5),
                      Text(
                        "Some fun trivia goes here...", // @string/trivia
                        style: const TextStyle(
                          fontFamily: 'Nunito_Regular',
                          fontSize: 12,
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                  const SizedBox(height: 0.5),
                ],
              ),
            ),
          ),

          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 25, right: 25),
              child: SizedBox(
                width: 250,
                height: 8,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(4),
                  child: LinearProgressIndicator(
                    value: _progressValue, // example progress
                    backgroundColor: MainColors.color_six,
                    color: MainColors.color_five,
                    minHeight: 8,
                  ),
                ),
              ),
            ),
          ),

          Visibility(
            visible: false,
            child: Container(
              color: Colors.black.withOpacity(0.4),
              child: const Center(child: CircularProgressIndicator()),
            ),
          ),
        ],
      ),
    );
  }
}
