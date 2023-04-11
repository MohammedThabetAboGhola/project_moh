import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../config/MyColors.dart';

class Screen4 extends StatefulWidget {
  final List data;
  const Screen4({super.key, required this.data});

  @override
  State<Screen4> createState() => _Screen4State();
}

class _Screen4State extends State<Screen4> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("تفاصيل المنح والاعفاءات", style: TextStyle(
              fontFamily: 'Cairo',
              fontSize: 17,
              fontWeight: FontWeight.bold,
              color: MyColors.white),),
          backgroundColor: MyColors.blue,
        ),
        body: ListView.separated(
            separatorBuilder: (context, index) {
              return const Divider(
                color: Colors.grey,
              );
            },
            itemCount: widget.data.length,
            itemBuilder: (context, index) {
              return Text("${widget.data[index]}\n",
                style: const TextStyle(
                    fontFamily: 'Cairo',
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: MyColors.blue),);
            }),
      ),
    );
  }
}
