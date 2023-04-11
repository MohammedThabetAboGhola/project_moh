import 'package:flutter/material.dart';

import '../../config/MyColors.dart';


class OnboardContent extends StatelessWidget {
  const OnboardContent({
    Key? key, required this.image, required this.title, required this.desc,
  }) : super(key: key);
  final String image , title, desc;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Spacer(),
        Image.asset(image,height: 250,),
        Spacer(),
        Text(title,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 25,
            fontFamily: 'Tajawal',
            color: MyColors.blue,
          ),
        ),
        Text(desc,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 22,
            fontFamily: 'Tajawal',
            color: MyColors.orange,
          ),
        ),
        Spacer()
      ],
    );
  }
}