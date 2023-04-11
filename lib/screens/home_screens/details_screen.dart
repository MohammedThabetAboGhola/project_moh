import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:project_moh/screens/home_screens/screen4.dart';

import '../../config/MyColors.dart';
import '../../constants/constants.dart';
import '../../data/details.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({super.key});

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  late List data;
  @override
  void initState() {
    super.initState();
    data = [];
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
          appBar: AppBar(
            leading: InkWell(
              child: const Icon(Icons.arrow_back),
              onTap: (){
                Navigator.pushReplacementNamed(context, MyConstants.HOME_SCREEN);
              },
            ),
            title: const Text(
              "المنح والاعفاءات",
              style:  TextStyle(
                  fontFamily: 'Cairo',
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                  color: MyColors.white),
            ),
            backgroundColor: MyColors.blue,
          ),
          body: ListView.separated(
              separatorBuilder: (context, index) => const Divider(
                    thickness: 2,
                  ),
              itemCount: DataDetails.data.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    setState(() {
                      if (data.isEmpty) {
                        readData(index);
                      } else if (data.isNotEmpty) {
                        data.clear();
                        readData(index);
                      }
                    });
                  },
                  child: ListTile(
                    title: Text(
                      " * ${DataDetails.data[index]['name']}",
                      style: const TextStyle(
                          fontFamily: 'Cairo',
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          color:  MyColors.blue),
                    ),
                    subtitle: Text(
                      "${DataDetails.data[index]['start']}",
                      style: const TextStyle(
                          fontFamily: 'Cairo',
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          color: MyColors.orange),
                    ),
                    trailing:
                        Text("${DataDetails.data[index]['exemption rate']}",
                          style: const TextStyle(
                              fontFamily: 'Cairo',
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: MyColors.orange),
                        ),
                  ),
                );
              })),
    );
  }

  void readData(int index) {
    for (int element = 0; element < DataDetails.data.length; element++) {
      if (DataDetails.data[element]['id'] == index) {
        data.add(
          DataDetails.data.elementAt(element)['details1'],
        );
        data.add(DataDetails.data.elementAt(element)['details2']);
        data.add(DataDetails.data.elementAt(element)['details3']);
      }
    }
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => Screen4(data: data)));
  }
}
