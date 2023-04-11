import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:project_moh/constants/constants.dart';
import 'package:project_moh/firebase/FirebaseFireStoreHelper.dart';
import '../../config/MyColors.dart';
import '../../firebase/FBAHelper.dart';
import '../../model/Users.dart';
import '../home_screens/home_screen.dart';
 
class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                child: Stack(
                  children: <Widget>[
                    Container(
                      padding: const EdgeInsets.fromLTRB(0.0, 150.0, 10, 0.0),
                      child: const Padding(
                        padding: EdgeInsets.only(right: 15),
                        child: Text(
                          "الدليل الجامعي",
                          style: TextStyle(
                            fontFamily: 'Tajawal',
                            fontSize: 25,
                            color: MyColors.blue,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),

                    Container(
                      padding: const EdgeInsets.fromLTRB(0.0, 185.0, 60.0, 0.0),
                      child: const Text(
                        "تسجيل الدخول",
                        style: TextStyle(
                          fontFamily: 'Tajawal',
                          fontSize: 22,
                          color: MyColors.orange,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),

                    Container(
                      padding: const EdgeInsets.fromLTRB(0.0, 145.0, 210.0, 0.0),
                      child: const Text(
                        ".",
                        style: TextStyle(
                          fontFamily: 'Tajawal',
                          fontSize: 80,
                          color: MyColors.yellow,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),

                    Container(
                      padding: const EdgeInsets.only(top: 300,left: 20,right: 20),
                      child: Column(
                        children: <Widget>[
                          TextField(
                            keyboardType: TextInputType.emailAddress,
                            controller: emailController,
                            decoration: InputDecoration(
                              prefixIcon: const Icon(Icons.email,color: MyColors.blue),
                              hintText: "البريد الإلكتروني",
                              hintStyle: const TextStyle(
                                fontSize: 17,
                                  fontFamily: 'Cairo',
                                  color: MyColors.blue
                              ),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(25),
                                  borderSide: const BorderSide(
                                      width: 2,
                                      color: MyColors.blue
                                  )
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(25),
                                borderSide: const BorderSide(
                                    width: 2,
                                    color: MyColors.blue
                                ),
                              ),
                            ),
                          ),

                          const SizedBox(height: 25,),

                          TextField(
                            keyboardType: TextInputType.visiblePassword,
                            controller: passwordController,
                            decoration: InputDecoration(
                              prefixIcon: const Icon(Icons.lock,color: MyColors.blue),
                              hintText: "كلمة المرور",
                              hintStyle: const TextStyle(
                                  fontSize: 17,
                                  fontFamily: 'Cairo',
                                  color: MyColors.blue
                              ),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(25),
                                  borderSide: const BorderSide(
                                      width: 2,
                                      color: MyColors.blue
                                  )
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(25),
                                borderSide: const BorderSide(
                                    width: 2,
                                    color: MyColors.blue
                                ),
                              ),
                            ),
                          ),

                          const SizedBox(height: 2,),

                          Padding(
                            padding: const EdgeInsets.only(),
                            child: Align(
                              alignment: AlignmentDirectional.centerStart,
                              child: TextButton(
                                onPressed: (){
                                  Navigator.pushReplacementNamed(context, MyConstants.FORGOT_PASSWORD_SCREEN);
                                },
                                child: const Text('هل نسيت كلمة المرور ؟',
                                  style: TextStyle(
                                      fontSize: 13,
                                      fontFamily: 'Cairo',
                                      color: MyColors.orange,
                                    fontWeight: FontWeight.bold
                                  ),),
                              ),
                            ),
                          ),

                          SizedBox(
                            width: double.infinity,
                            height: 60,
                            child: ElevatedButton(
                              onPressed: (){
                                // Navigator.pushReplacementNamed(context, '/home_screen');
                                login();

                              },
                              style: ElevatedButton.styleFrom(
                                primary: MyColors.blue,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(25)
                                ),
                              ),
                              child: const Text('تسجيل الدخول',
                                style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Cairo',
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 8,),
                          Padding(
                            padding: const EdgeInsets.only(right: 65),
                            child: Row(
                              children: [
                                const Text("ليس لديك حساب ؟",
                                  style: TextStyle(fontSize: 17,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Cairo',
                                    color: MyColors.blue
                                  ),
                                ),
                                Align(
                                  alignment: AlignmentDirectional.centerEnd,
                                  child: TextButton(
                                    onPressed: (){
                                      Navigator.pushReplacementNamed(context, MyConstants.SIGN_UP_SCREEN);
                                    },
                                    child: const Text(' سجل الان',
                                      style: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold,
                                        color: MyColors.orange,
                                        fontFamily: 'Cairo',
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )

                        ],
                      ),
                    ),

                  ],
                ),
              )
            ],
          ),
        ),
      ),);
  }

  Future login () async{
       UserCredential? userCredential = await FirebaseAuthHelper.firebaseAuthHelper.signIn(users: Users(
         email: emailController.text,
         password: passwordController.text,
       ), context: context);


      if (userCredential?.user?.uid != null) {
        Navigator.push(context, MaterialPageRoute(builder: (_) {
          return HomeScreen();
        }));
      } else {
        print("else");
        print(userCredential?.user?.uid);
      }
  }
}



