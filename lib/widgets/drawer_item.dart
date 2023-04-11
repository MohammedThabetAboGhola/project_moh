import 'package:flutter/material.dart';
import 'package:project_moh/constants/constants.dart';

import '../config/MyColors.dart';
import '../firebase/FBAHelper.dart';

class DrawerItem extends StatelessWidget {
  final String? title;
  final String? routName;
  final IconData? icon;

  const DrawerItem({
    super.key,
    required this.title,
    required this.icon,
    required this.routName,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (routName! == MyConstants.LOGIN_SCREEN) {
          FirebaseAuthHelper.firebaseAuthHelper.logout();
          Navigator.pushReplacementNamed(context, routName!);
        } else {
          Navigator.pushReplacementNamed(context, routName!);
        }
      },
      child: Padding(
        padding: const EdgeInsets.only(
          bottom: 25,
        ),
        child: Row(
          children: [
            Text(
              title!,
              style: const TextStyle(
                fontFamily: 'Cairo',
                fontSize: 17,
                fontWeight: FontWeight.bold,
                color: MyColors.blue,
              ),
            ),
            const Spacer(),
            Icon(
              icon!,
              color: MyColors.orange,
              size: 20,
            ),
          ],
        ),
      ),
    );
  }
}
