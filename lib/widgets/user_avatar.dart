import 'package:flutter/material.dart';
import 'package:project_moh/config/MyColors.dart';

class UserAvatar extends StatelessWidget {
  final String imageName;
  const UserAvatar({
    super.key,
    required this.imageName,
  });

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 32,
      backgroundColor: MyColors.orange,
      child: CircleAvatar(
        radius: 29,
        backgroundImage: Image.asset('assets/images/$imageName').image,
      ),
    );
  }
}
