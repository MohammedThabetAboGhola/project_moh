import 'package:flutter/material.dart';
import 'package:project_moh/config/MyColors.dart';

import '../../firebase/FirebaseFireStoreHelper.dart';

class BachelorScreen extends StatelessWidget {
  final List data;
  final List color;
  const BachelorScreen({Key? key, required this.data, required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: MyColors.blue,
          title: const Text(
            "برامج البكالوريس",
            style: TextStyle(
                fontSize: 17,
                fontFamily: 'Cairo',
                fontWeight: FontWeight.bold
            ),
          ),
        ),
        body:  ListView.builder(
            itemCount: data.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 10,top: 10),
                child: ListTile(
                  tileColor: MyColors.white,
                  trailing: InkWell(
                    child : Icon(Icons.favorite_border,color: MyColors.orange,),
                    onTap: (){
                      FirebaseFireStoreHelper.fireStoreHelper.addFavToUser(data[index]);
                      print("$index");
                    },
                  ),

                  title: Center(
                    child: Text("${data[index]}",
                      style:const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Cairo',
                        color: MyColors.blue,
                      ),
                    ),
                  ),

                ),
              );
            }),
      ),
    );
  }
}
