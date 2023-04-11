

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:project_moh/constants/constants.dart';
import 'package:project_moh/firebase/FBAHelper.dart';

import '../../config/MyColors.dart';


class Favorite extends StatefulWidget {
  const Favorite({Key? key}) : super(key: key);

  @override
  State<Favorite> createState() => _FavoriteState();
}

class _FavoriteState extends State<Favorite> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: MyColors.blue,
          title: const Text(
            "مفضلتي",
            style:TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                fontFamily: 'Cairo'
            ),
          ),
          leading: IconButton(
            onPressed: (){
            Navigator.pushReplacementNamed(context, MyConstants.HOME_SCREEN);
          }, icon: Icon(Icons.arrow_back,)),
        ),

        body: Container(
          padding: EdgeInsets.all(15),
          child: StreamBuilder(
              stream: FirebaseFirestore.instance.collection("Fav")
              .doc(FirebaseAuth.instance.currentUser!.uid).collection('sup').snapshots(),
              builder: (context, AsyncSnapshot snapshot) {
                if (snapshot.hasError) {
                  return const Text('Something went wrong');
                }

                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Text("Loading");
                }
                return ListView.builder(
                  itemCount: snapshot.data.docs.length,
                  itemBuilder: (context,index){

                    return Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: ListTile(
                        title: Text("${snapshot.data.docs[index]['nameSpe']}",
                          style:const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Cairo',
                            color: MyColors.blue,
                          ),
                        ),
                        trailing: InkWell(
                          child : Icon(Icons.favorite,color: MyColors.orange,),
                          onTap: (){

                          },
                        ),

                      ),
                    );

                  },
                );
              },
            ),
        ),
          // trailing: Icon(Icons.favorite,color: MyColors.orange,),

      ),
    );
  }
}
