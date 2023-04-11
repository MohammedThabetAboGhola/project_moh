import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:project_moh/config/MyColors.dart';
import 'package:project_moh/firebase/FirebaseFireStoreHelper.dart';

class MasterScreen extends StatelessWidget {
  final List data;
  const MasterScreen({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: MyColors.blue,
          title: const Text(
            "برامج الماجستير",
            style:TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                fontFamily: 'Cairo'
            ),
          ),
        ),
        body: ListView.builder(
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
