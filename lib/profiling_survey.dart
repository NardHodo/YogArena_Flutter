import 'package:flutter/material.dart';
import 'package:flutter_projects/main_colors.dart';

class Profiling extends StatefulWidget{
  const Profiling({super.key});

  @override
  State<Profiling> createState() => _ProfilingState();
}

class _ProfilingState extends State<Profiling>{

  @override
  Widget build(BuildContext){
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: MainColors.color_one,
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text("Yogi Profiling Questionnaire", style: TextStyle(
                  fontSize: 25,
                  fontFamily: 'Merriweather_Bold'
                ),),
                Padding(
                    padding: EdgeInsets.symmetric(horizontal: 50.0),
                    child:
                    const Text("To make sure that you have what it takes to be a full fledged yogi, we recommend you to answer the pre-participation health form. "
                        "This ensure that you are physically and mentally ready for yoga and for YogArena to measure your overall skills and knowledge.",
                      softWrap: true,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontFamily: 'Nunito_Bold',
                          fontSize: 15
                      ),),),
                const Text("Please Agree to Our Data Privacy Policy first before proceeding",
                  softWrap: true,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontFamily: 'Nunito_Regular'
                  ),),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: (){debugPrint("ButtonPressed");},
                      style: ElevatedButton.styleFrom(
                          backgroundColor: MainColors.color_three,
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0)
                          ),
                      ),
                      child: const Text(
                        'Answer Survey',
                        style: TextStyle(
                            fontSize: 15,
                            fontFamily: 'Merriweather_Bold',
                            fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                  ],
                )
              ],
            )
        ),
      )
    );
  }
}