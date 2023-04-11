import 'package:flutter/material.dart';
import 'package:project_moh/config/MyColors.dart';

import '../../data/data.dart';
import 'bachelor_screen.dart';

class AllSpecialties extends StatefulWidget {
  const AllSpecialties({Key? key}) : super(key: key);

  @override
  State<AllSpecialties> createState() => _AllSpecialtiesState();
}

class _AllSpecialtiesState extends State<AllSpecialties> {
  List all_collage = [
    {"specialization": "كلية الحاسبات وتكنولوجيا المعلومات"},
    {"specialization": "كلية التربية"},
    {"specialization": "كلية العلوم التطبيقية"},
    {"specialization": "كلية الاعلام"},
    {"specialization": "كلية الفنون "},
    {"specialization": "كلية الاداب والعلوم الانسانية"},
    {"specialization": "كلية الادارة والتمويل"},
    {"specialization": "كلية العلوم الطبية"},
  ];

  List colorCollage = [
    MyColors.blue,
    MyColors.blue,
    MyColors.blue,
    MyColors.blue,
    MyColors.blue,
    MyColors.blue,
    MyColors.blue,
    MyColors.blue,
    MyColors.blue,
    MyColors.blue,
    MyColors.blue,
    MyColors.blue,
    MyColors.blue,
  ];
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
            backgroundColor: MyColors.blue,
            title: const Text(
              "اقسام الكليات",
              style: TextStyle(
                  fontSize: 17,
                  fontFamily: 'Cairo',
                  fontWeight: FontWeight.bold
              ),
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.all(10.0),
            child: ListView.builder(
                itemCount: all_collage.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        width: double.infinity,
                        height: 70,
                        child: ElevatedButton(
                            onPressed: () {
                              setState(() {
                                if (data.isEmpty) {
                                  readData(index);
                                } else if (data.isNotEmpty) {
                                  data.clear();
                                  readData(index);
                                }
                              });
                            },
                            style: ElevatedButton.styleFrom(
                                primary: MyColors.blue,
                                onPrimary: Colors.white,
                                shadowColor: MyColors.orange,

                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                )),
                            child: Text(
                              "${all_collage[index]['specialization']}",
                              style: const TextStyle(
                                  fontSize: 17,
                                  fontFamily: 'Cairo',
                                  fontWeight: FontWeight.bold
                              ),
                            )
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                    ],
                  );
                }),
          )),
    );
  }

  void readData(int index) {
    for (int element = 0; element < DataSource.data.length; element++) {
      if (DataSource.data[element]['id'] == index) {
        data.add(
          DataSource.data.elementAt(element)['specialization'],
        );
      }
    }
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => BachelorScreen(
                  data: data,
                  color: colorCollage,
                )));
  }
}
