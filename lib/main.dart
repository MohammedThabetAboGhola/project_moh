import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:project_moh/constants/constants.dart';
import 'package:project_moh/screens/home_screens/Favorite.dart';
import 'package:project_moh/screens/home_screens/all_specialties.dart';
import 'package:project_moh/screens/home_screens/details_screen.dart';
import 'package:project_moh/screens/home_screens/home_screen.dart';
import 'package:project_moh/screens/home_screens/social_search.dart';
import 'package:project_moh/screens/onboarding_screen/launch_screen.dart';
import 'package:project_moh/screens/logn_screens/Login_screen.dart';
import 'package:project_moh/screens/logn_screens/Sign_up.dart';
import 'package:project_moh/screens/logn_screens/forgot_password_screen.dart';
import 'package:project_moh/screens/onboarding_screen/onboarding_screen.dart';
import 'firebase/firebase_options.dart';

void main() async {
  runApp(const MyApp());
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        drawerTheme: const DrawerThemeData(scrimColor: Colors.transparent),
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: MyConstants.HOME_SCREEN,
      routes: {
        MyConstants.LAUNCH_SCREEN: (context) => const LaunchScreen(),
        MyConstants.HOME_SCREEN: (context) => const HomeScreen(),
        MyConstants.LOGIN_SCREEN: (context) => const LoginScreen(),
        MyConstants.SIGN_UP_SCREEN: (context) => const SignUp(),
        MyConstants.FORGOT_PASSWORD_SCREEN: (context) =>
            const ForgotPasswordScreen(),
        MyConstants.ALL_SPE_SCREEN: (context) => const AllSpecialties(),
        MyConstants.On_Boarding_Screen: (context) => const OnBoardingScreen(),
        MyConstants.Favorite: (context) => const Favorite(),
        MyConstants.DETAILS_SCREEN_M: (context) => const DetailsScreen(),
        MyConstants.SOCIAL_SEARCH: (context) => const SocialSearch(),
      },
    );
  }
}
