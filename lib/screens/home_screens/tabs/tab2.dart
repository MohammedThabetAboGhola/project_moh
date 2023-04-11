import 'package:flutter/material.dart';
import 'package:project_moh/config/MyColors.dart';
import 'package:project_moh/constants/constants.dart';

import '../../../data/data.dart';
import '../diploma_screen.dart';
import '../master_screen.dart';

class TabBar2 extends StatefulWidget {
  const TabBar2({Key? key}) : super(key: key);

  @override
  State<TabBar2> createState() => _TabBar2State();
}

class _TabBar2State extends State<TabBar2> {
  late List data1;
  late List data2;
  @override
  void initState() {
    super.initState();
    data1 = [];
    data2 = [];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsetsDirectional.only(top: 20),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            SizedBox(
              width: double.infinity,
              height: 70,
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, MyConstants.ALL_SPE_SCREEN);
                  },
                  style: ElevatedButton.styleFrom(
                      primary: MyColors.orange,
                      onPrimary: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10))),
                  child: const Text(
                    "برامج البكالوريوس",
                    style:TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Cairo'
                    ),
                  )),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              width: double.infinity,
              height: 70,
              child: ElevatedButton(
                  onPressed: () {
                      readDiploma();
                  },
                  style: ElevatedButton.styleFrom(
                      primary: MyColors.blue,
                      onPrimary: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10))),
                   child: const Text(
                     "برامج الدبلوم",
                     style:TextStyle(
                         fontSize: 25,
                         fontWeight: FontWeight.bold,
                         fontFamily: 'Cairo'
                     ),
                  )
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              width: double.infinity,
              height: 70,
              child: ElevatedButton(
                  onPressed: () {
                    readMaster();
                  },
                  style: ElevatedButton.styleFrom(
                      primary: MyColors.yellow,
                      onPrimary: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10))),
                  child: const Text(
                    "برامج الماجستير",
                    style:TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Cairo'
                    ),
                  )),
            ),
          ],
        ),
      ),
    );
  }

  void readDiploma() {
    for (int element = 0; element < DataSource.data.length; element++) {
      if (DataSource.data[element]['id'] == 8) {
        data1.add(
          DataSource.data.elementAt(element)['specialization'],
        );
      }
    }
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => DiplomaScreen(data: data1)));
  }

  void readMaster() {
    for (int element = 0; element < DataSource.data2.length; element++) {
      if (DataSource.data2[element]['id'] == 9) {
        data2.add(
          DataSource.data2.elementAt(element)['specialization'],
        );
      }
    }
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => MasterScreen(data: data2)));
  }
}
