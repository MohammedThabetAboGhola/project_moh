import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:project_moh/constants/constants.dart';

import '../../config/MyColors.dart';

class SocialSearch extends StatefulWidget {
  const SocialSearch({super.key});

  @override
  State<SocialSearch> createState() => _SocialSearchState();
}

class _SocialSearchState extends State<SocialSearch> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
          appBar: AppBar(
            leading: InkWell(
              child: const Icon(Icons.arrow_back),
              onTap: () {
                Navigator.pushReplacementNamed(
                    context, MyConstants.HOME_SCREEN);
              },
            ),
            backgroundColor: MyColors.blue,
            title: const Text(
              "البحث الاجتماعي",
              style: TextStyle(
                  fontFamily: 'Cairo',
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                  color: MyColors.white),
            ),
          ),
          body: Container(
            margin: const EdgeInsets.only(top: 50, left: 10, right: 10),
            child: Column(
              children: [
                const Text(
                  "الخطوات المتبعة للاستفادة من البحث الاجتماعي :",
                  style: TextStyle(
                      fontFamily: 'Tajawal',
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: MyColors.orange),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  MyConstants.SOCIAL_SEARCH_DE,
                  style: const TextStyle(
                      fontFamily: 'Cairo',
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      color: MyColors.blue),
                )
              ],
            ),
          )),
    );
  }
}
