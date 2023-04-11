import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:project_moh/constants/constants.dart';
import 'package:project_moh/screens/home_screens/home_screen.dart';
import '../../config/MyColors.dart';
import '../../firebase/FBAHelper.dart';
import '../../firebase/FirebaseFireStoreHelper.dart';
import '../../model/Users.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();

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
                        "تسجيل الإشتراك",
                        style: TextStyle(
                          fontFamily: 'Tajawal',
                          fontSize: 22,
                          color: MyColors.orange,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),

                    Container(
                      padding: const EdgeInsets.fromLTRB(0.0, 145.0, 238.0, 0.0),
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


                          TextFormField(
                            keyboardType: TextInputType.text,
                            controller: nameController,
                            validator: (value){
                              RegExp regex = RegExp(
                                  r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
                              if (value!.isEmpty) {
                                return 'الرجاء إدخال الإيميل';
                              } else if (!regex.hasMatch(value)) {
                                return 'الإيميل غير صحصيح';
                              } else {
                                return null;
                              }
                            },
                            decoration: InputDecoration(
                              prefixIcon: const Icon(Icons.person,color: MyColors.blue),
                              hintText: "اسم المستخدم",
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

                          TextFormField(
                            validator: (value){
                          RegExp regex = RegExp(
                           r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
                          if (value!.isEmpty) {
                            return 'الرجاء إدخال الإيميل';
                          } else if (!regex.hasMatch(value)) {
                          return 'الإيميل غير صحصيح';
                          } else {
                          return null;
                          }},
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
                            keyboardType: TextInputType.emailAddress,
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

                          const SizedBox(height: 25,),
                          SizedBox(
                            width: double.infinity,
                            height: 60,
                            child: ElevatedButton(
                              onPressed: (){

                                singUp();
                              },
                              style: ElevatedButton.styleFrom(
                                primary: MyColors.blue,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(25)
                                ),
                              ),
                              child: const Text('تسجيل الإشتراك',
                                style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Cairo',
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 8,),
                          Padding(
                            padding: const EdgeInsets.only(right: 65),
                            child: Row(
                              children: [
                                const Text(" لديك حساب فعال؟",
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
                                      Navigator.pushReplacementNamed(context,MyConstants.LOGIN_SCREEN);
                                    },
                                    child: const Text(' دخول الان',
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

  Future singUp () async{

    if(emailController.text.isNotEmpty &&
        nameController.text.isNotEmpty && passwordController.text.isNotEmpty){


      UserCredential? userCredential = await FirebaseAuthHelper.firebaseAuthHelper.createAccount(Users(
          email: emailController.text,
          password: passwordController.text,
          name: nameController.text),context);

      String? uidUser = userCredential?.user?.uid;

      Navigator.push(context, MaterialPageRoute(builder: (_) {
        return HomeScreen();
      }));

    }
  }

  Future saveUser() async {

  }

}
