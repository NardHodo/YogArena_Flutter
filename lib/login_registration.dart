import 'package:flutter/material.dart';
import 'package:flutter_projects/main_colors.dart';
import 'package:flutter_projects/main_menu.dart';

class Login_Registration extends StatefulWidget {
  const Login_Registration({super.key});

  @override
  State<Login_Registration> createState() => _Login_RegistrationState();
}

class _Login_RegistrationState extends State<Login_Registration> {
  final TextEditingController _usernameProcess = TextEditingController();
  final TextEditingController _passwordProcess = TextEditingController();

  @override
  void dispose() {
    _usernameProcess.dispose();
    super.dispose();
  }

  //call dialog function
  // Future<void> _showLoginDialog(BuildContext context)async{
  //   return showDialog(context: context, builder: (BuildContext context){
  //     double screenWidth = MediaQuery.of(context).size.width;
  //     double screenHeight = MediaQuery.of(context).size.height;
  //     bool obscurePassword = true;

  //     //build dialog layout
  //     return AlertDialog(
  //       backgroundColor: MainColors.color_three,
  //       content: SingleChildScrollView(
  //         scrollDirection: Axis.vertical,
  //         child: SizedBox(
  //           width: screenWidth * 0.3,
  //           height: screenHeight * 0.8,
  //           child: Column(
  //             children: <Widget>[
  //               const Text("Welcome Back!", style: TextStyle(fontSize: 20, fontFamily: 'Merriweather_Bold', color: Colors.white),),
  //               TextField(
  //                 cursorColor: Colors.white,
  //                 style: TextStyle(
  //                   fontFamily: 'Merriweather_Bold',
  //                   fontSize: 15,
  //                   color: Colors.white,
  //                 ),
  //                 controller: _usernameProcess,
  //                 decoration: const InputDecoration(labelText: 'Username', labelStyle: TextStyle(color: Colors.white, fontFamily: 'Merriweather_Regular'),
  //                     enabledBorder: UnderlineInputBorder(
  //                         borderSide: BorderSide(
  //                           color: Colors.white,
  //                           width: 2.0,
  //                         )
  //                     ),

  //                     focusedBorder: UnderlineInputBorder(
  //                         borderSide: BorderSide(
  //                             color: Colors.white,
  //                             width: 3.0
  //                         )
  //                     )
  //                 ),
  //               ),
  //               const SizedBox(height: 16.0),

  //               TextField(
  //                   cursorColor: Colors.white,
  //                   style: TextStyle(
  //                       fontFamily: 'Merriweather_Bold',
  //                       fontSize: 15,
  //                       color: Colors.white,
  //                   ),
  //                   controller: _passwordProcess,
  //                   obscureText: obscurePassword,
  //                   decoration: const InputDecoration(
  //                       labelText: 'Password',
  //                       labelStyle: TextStyle(color: Colors.white, fontFamily: 'Merriweather_Regular'),
  //                       enabledBorder: UnderlineInputBorder(
  //                           borderSide: BorderSide(
  //                             color: Colors.white,
  //                             width: 2.0,
  //                           )
  //                       ),

  //                       focusedBorder: UnderlineInputBorder(
  //                           borderSide: BorderSide(
  //                               color: Colors.white,
  //                               width: 3.0
  //                           )
  //                       ))
  //               ),
  //               Expanded(
  //                   child: Align(
  //                     alignment: AlignmentGeometry.bottomCenter,
  //                     child: Container(
  //                       padding: const EdgeInsets.only(bottom: 10.0),
  //                       child: Row(
  //                         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  //                         children: [
  //                           ElevatedButton(
  //                             onPressed: () {Navigator.pop(context);},
  //                             style: ElevatedButton.styleFrom(
  //                               backgroundColor: Colors.white,
  //                               foregroundColor: MainColors.color_five,
  //                               shape: RoundedRectangleBorder(
  //                                 borderRadius: BorderRadius.circular(15.0),
  //                               ),
  //                             ),
  //                             child: const Text(
  //                               'Cancel',
  //                               style: TextStyle(
  //                                   fontSize: 14,
  //                                   fontFamily: 'Merriweather_Bold',
  //                                   fontWeight: FontWeight.bold
  //                               ),
  //                             ),
  //                           ),
  //                           ElevatedButton(
  //                             onPressed: () {debugPrint('Button Pressed');},
  //                             style: ElevatedButton.styleFrom(
  //                               backgroundColor: Colors.white,
  //                               foregroundColor: MainColors.color_five,
  //                               shape: RoundedRectangleBorder(
  //                                 borderRadius: BorderRadius.circular(15.0),
  //                               ),
  //                             ),
  //                             child: const Text(
  //                               'Confirm',
  //                               style: TextStyle(
  //                                   fontSize: 14,
  //                                   fontFamily: 'Merriweather_Bold',
  //                                   fontWeight: FontWeight.bold
  //                               ),
  //                             ),
  //                           )
  //                         ],
  //                       ),
  //                     ),
  //                   ))
  //             ],
  //           ),
  //         ),
  //       ),
  //     );
  //   },);
  // }

  // Future<void> _showRegistrationDialog(BuildContext context)async{
  //   return showDialog(context: context, builder: (BuildContext context){
  //     double screenWidth = MediaQuery.of(context).size.width;
  //     double screenHeight = MediaQuery.of(context).size.height;
  //
  //     return AlertDialog(
  //       backgroundColor: MainColors.color_three,
  //       insetPadding: ,
  //     )
  //   });
  // }

  @override
  Widget build(BuildContext) {
    return Scaffold(
      resizeToAvoidBottomInset:
          false, // para di mag scroll pag in-open keyboard
      backgroundColor: MainColors.color_one,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 1.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const SizedBox(height: 1),
                      Image.asset(
                        'assets/images/main_title_logo.png',
                        width: 400,
                        height: 200,
                        fit: BoxFit.contain,
                      ),
                    ],
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(bottom: 24.0, top: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const UIManager(),
                          ),
                          (Route<dynamic> route) => false,
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: MainColors.color_six,
                        foregroundColor: MainColors.color_five,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6.0),
                        ),
                        fixedSize: const Size(130, 40),
                      ),
                      child: const Text(
                        'LOGIN',
                        style: TextStyle(
                          fontSize: 14,
                          fontFamily: 'Merriweather_Bold',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        debugPrint('Button Pressed');
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: MainColors.color_six,
                        foregroundColor: MainColors.color_five,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6.0),
                        ),
                        fixedSize: const Size(130, 40),
                      ),
                      child: const Text(
                        'REGISTER',
                        style: TextStyle(
                          fontSize: 14,
                          fontFamily: 'Merriweather_Bold',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
//Fuck this shit, 200+ lines tas tatlong elements pa lang