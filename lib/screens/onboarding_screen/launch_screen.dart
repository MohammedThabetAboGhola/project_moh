import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:project_moh/config/MyColors.dart';
import 'package:project_moh/constants/constants.dart';
import 'package:project_moh/firebase/FBAHelper.dart';



import '../../firebase/firebase_options.dart';
import '../home_screens/home_screen.dart';
import 'onboarding_screen.dart';


class LaunchScreen extends StatefulWidget {
  const LaunchScreen({Key? key}) : super(key: key);

  @override
  State<LaunchScreen> createState() => _LaunchScreenState();
}

class _LaunchScreenState extends State<LaunchScreen> {
  @override
  void initState() {
    // TODO: implement initState
    Future.delayed(Duration(seconds: 4),(){

      if(FirebaseAuthHelper.firebaseAuthHelper.isLoggedIn()){
        Navigator.pushReplacementNamed(context, MyConstants.HOME_SCREEN);
      }else{
        Navigator.pushReplacementNamed(context, MyConstants.On_Boarding_Screen);
      }
    });
    super.initState();


  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        alignment: Alignment.center,
        child: AnimatedSplashScreen(
          splash: Wrap(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 100),
                child: Column(
                  children: [
                    Image.asset(
                      'assets/images/logo.png',
                      width: 100,
                      height: 100,
                    ),
                    const Text(
                      "الدليل الجامعي",
                      style: TextStyle(
                        fontFamily: 'Tajawal',
                        fontSize: 22,
                        color: MyColors.blue,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          nextScreen: const OnBoardingScreen(),
          duration: 8000,
          splashIconSize: 350,
        ),
      ),
    );
  }
}
