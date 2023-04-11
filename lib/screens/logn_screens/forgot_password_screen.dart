import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../config/MyColors.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.only(left: 30,right: 30),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(top: 110),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 200,
                    padding: EdgeInsets.only(bottom: 20),
                    child: Icon(Icons.question_mark_outlined,size: 180,color: MyColors.orange,)
                  ),
                  Container(
                    child: Column(
                      children: const [
                        Align(
                          alignment: AlignmentDirectional.center,
                          child: Text('نسيت كلمة المرور ؟',
                          style: TextStyle(
                              fontSize: 17,
                              fontFamily: 'Cairo',
                              color: MyColors.blue,
                            fontWeight: FontWeight.bold
                          ),)
                        ),
                        SizedBox(height: 10,),
                        Padding(
                          padding: EdgeInsets.only(right: 15),
                          child: Align(
                              alignment: AlignmentDirectional.center,
                              child: Text('ادخل عنوان البريد الإلكتروني الخاص بك لإرسال رمز إعادة تعين كلمة المرور ',
                                style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold,
                                   color: Colors.grey,
                                    fontFamily: 'Cairo',
                                ),)
                          ),
                        ),

                      ],
                    ),
                  ),
                  const SizedBox(height: 20,),
                  // TextFiled Email
                  Container(
                    child: TextField(
                      keyboardType: TextInputType.emailAddress,
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
                  ),
                  const SizedBox(height: 20,),

                  SizedBox(
                    width: double.infinity,
                    height: 60,
                    child: ElevatedButton(
                      onPressed: (){},
                      child: Text('ارسل الرمز',
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Cairo',
                          color: Colors.white,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: MyColors.blue,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25)
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: 10,),
                  Padding(
                    padding: const EdgeInsets.only(right: 50),
                    child: Row(
                      children: [
                        Text("تذكرت كلمة المرور ؟",
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
                              Navigator.pushReplacementNamed(context, '/login');
                            },
                            child: Text('دخول الان',
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
          ),
        ),
      ),
    );
  }
}
