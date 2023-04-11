import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:project_moh/config/MyColors.dart';

import '../model/Users.dart';
import 'FirebaseFireStoreHelper.dart';

class FirebaseAuthHelper {
  FirebaseAuthHelper._();
  static FirebaseAuthHelper firebaseAuthHelper = FirebaseAuthHelper._();

  FirebaseAuth auth = FirebaseAuth.instance;
    String? uid;
    String? id;

    Future createAccount(Users user, BuildContext context) async {
      try {
        UserCredential userCredential = await auth.createUserWithEmailAndPassword(
            email: user.email!, password: user.password!);
        uid = userCredential.user!.uid;
        FirebaseFireStoreHelper.fireStoreHelper.SaveUserData(user, uid!);

        // SharedPrefController().saveUid(uid: id);
        return userCredential;
      } on FirebaseAuthException catch (e) {
        if (e.code == "weak-password") {
          //print("The password is too weak");

          ScaffoldMessenger.of(context).
          showSnackBar(const SnackBar(content: Text("كلمة المرور ضعيفة",style: TextStyle(
              fontFamily: 'Tajawal',fontSize: 17,fontWeight: FontWeight.bold
          ),textAlign: TextAlign.center),
            backgroundColor: MyColors.orange,
          ));

        }

        else if (e.code == "email-already-in-use") {
          //print("The email already exists for that email");

          ScaffoldMessenger.of(context).
          showSnackBar(const SnackBar(content: Text("الإيميل مستخدم",style: TextStyle(
              fontFamily: 'Tajawal',fontSize: 17,fontWeight: FontWeight.bold
          ),textAlign: TextAlign.center),
            backgroundColor: MyColors.orange,
          ));

        }

        else if (e.code == "invalid-email") {
          //print("The email invalid");

          ScaffoldMessenger.of(context).
          showSnackBar(const SnackBar(content: Text("الإيميل غير صحيح",style: TextStyle(
              fontFamily: 'Tajawal',fontSize: 17,fontWeight: FontWeight.bold
          ),textAlign: TextAlign.center),
            backgroundColor: MyColors.orange,
          ));
        }

       // operation-not-allowed
        else if (e.code == "operation-not-allowed") {
          //print("The email invalid");

          ScaffoldMessenger.of(context).
          showSnackBar(const SnackBar(content: Text("العملية غير مسموح بها",style: TextStyle(
              fontFamily: 'Tajawal',fontSize: 17,fontWeight: FontWeight.bold
          ),textAlign: TextAlign.center),
            backgroundColor: MyColors.orange,
          ));
        }
      } catch (e) {
        print(e);
      }
      return null;
    }


    Future<UserCredential?> signIn({required Users users,required BuildContext context}) async {
      try {
        UserCredential userCredential = await auth.signInWithEmailAndPassword(
            email: users.email!, password: users.password!);
        id = userCredential.user!.uid;
        return userCredential;
      } on FirebaseAuthException catch (e) {
        if (e.code == "user-disabled") {
          //print("The password is too weak");

          ScaffoldMessenger.of(context).
          showSnackBar(const SnackBar(content: Text("المستخدم معطل",style: TextStyle(
              fontFamily: 'Tajawal',fontSize: 17,fontWeight: FontWeight.bold
          ),textAlign: TextAlign.center),
            backgroundColor: MyColors.orange,
          ));

        } else if (e.code == "user-not-found") {
          ScaffoldMessenger.of(context).
          showSnackBar(const SnackBar(content: Text("المستخدم غير موجود",style: TextStyle(
              fontFamily: 'Tajawal',fontSize: 17,fontWeight: FontWeight.bold
          ),textAlign: TextAlign.center),
            backgroundColor: MyColors.orange,
          ));

          // print("The email already exists for that email");
        } else if (e.code == "invalid-email") {

          ScaffoldMessenger.of(context).
          showSnackBar(const SnackBar(content: Text("إيميل غير صحصيح",style: TextStyle(
              fontFamily: 'Tajawal',fontSize: 17,fontWeight: FontWeight.bold
          ),textAlign: TextAlign.center),
            backgroundColor: MyColors.orange,
          ));

          // print("The email invalid");

        }else if (e.code == "wrong-password") {

          ScaffoldMessenger.of(context).
          showSnackBar(const SnackBar(content: Text("كلمة المرور غير صحيحة",style: TextStyle(
              fontFamily: 'Tajawal',fontSize: 17,fontWeight: FontWeight.bold
          ),textAlign: TextAlign.center),
            backgroundColor: MyColors.orange,
          ));

          // print("The email invalid");

        }

      } catch (e) {
        ScaffoldMessenger.of(context).
        showSnackBar(SnackBar(content: Text("$e",style: const TextStyle(
            fontFamily: 'Tajawal',fontSize: 17,fontWeight: FontWeight.bold
        ),textAlign: TextAlign.center),
          backgroundColor: MyColors.orange,
        ));
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("$e")));
      }
      return null;
    }

  Future logout() async {
    await auth.signOut();
  }

  Future resetPassword(Users users) async {
    await auth.sendPasswordResetEmail(email: users.email!);
  }
    bool isLoggedIn() {
      return auth.currentUser != null;
    }
}